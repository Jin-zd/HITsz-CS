import argparse
from dataclasses import dataclass
from typing import Tuple

import torch

from mnist_utils import load_mnist_from_dir, iterate_minibatches, random_shift


@dataclass
class MLPConfig:
    in_dim: int = 28 * 28
    hidden_dim: int = 256
    out_dim: int = 10
    weight_scale: float = 0.01
    l2: float = 5e-4
    momentum: float = 0.9


class MLPManual:
    """A simple 1-hidden-layer MLP with manual forward/backward (no autograd)."""

    def __init__(self, cfg: MLPConfig, device: torch.device):
        self.cfg = cfg
        self.device = device
        g = torch.Generator(device='cpu')
        # Xavier/He-ish scaled init for stability
        w1_scale = (2.0 / (cfg.in_dim + cfg.hidden_dim)) ** 0.5
        w2_scale = (2.0 / (cfg.hidden_dim + cfg.out_dim)) ** 0.5
        self.W1 = (torch.randn(cfg.in_dim, cfg.hidden_dim, generator=g) * w1_scale).to(device)
        self.b1 = torch.zeros(cfg.hidden_dim, device=device)
        self.W2 = (torch.randn(cfg.hidden_dim, cfg.out_dim, generator=g) * w2_scale).to(device)
        self.b2 = torch.zeros(cfg.out_dim, device=device)

        # velocities for momentum
        self.vW1 = torch.zeros_like(self.W1)
        self.vb1 = torch.zeros_like(self.b1)
        self.vW2 = torch.zeros_like(self.W2)
        self.vb2 = torch.zeros_like(self.b2)

    def forward(self, x: torch.Tensor) -> Tuple[torch.Tensor, dict]:
        """
        x: [B, 1, 28, 28] or [B, 784]
        returns logits [B, 10] and cache for backward
        """
        if x.dim() == 4:
            x = x.view(x.shape[0], -1)
        elif x.dim() == 2:
            pass
        else:
            raise ValueError("x must be [B,1,28,28] or [B,784]")

        z1 = x @ self.W1 + self.b1  # [B,H]
        # ReLU
        a1 = torch.maximum(z1, torch.zeros_like(z1))
        logits = a1 @ self.W2 + self.b2  # [B,10]
        cache = {
            'x': x,
            'z1': z1,
            'a1': a1,
        }
        return logits, cache

    @staticmethod
    def softmax_cross_entropy_with_logits(logits: torch.Tensor, y: torch.Tensor) -> Tuple[torch.Tensor, torch.Tensor]:
        """
        Compute mean cross-entropy and gradient wrt logits.
        logits: [B, C]; y: [B] int64
        returns: loss (scalar tensor), dlogits [B, C]
        """
        # stable softmax
        max_logits, _ = torch.max(logits, dim=1, keepdim=True)
        logits_shifted = logits - max_logits
        exp = torch.exp(logits_shifted)
        sum_exp = torch.sum(exp, dim=1, keepdim=True)
        probs = exp / sum_exp
        # one-hot subtract
        B, C = logits.shape
        y_onehot = torch.zeros_like(logits)
        y_onehot[torch.arange(B, device=logits.device), y] = 1.0
        # CE = -log p(y)
        p_y = probs[torch.arange(B, device=logits.device), y]
        loss = -torch.log(torch.clamp(p_y, min=1e-9)).mean()
        dlogits = (probs - y_onehot) / B
        return loss, dlogits

    def backward(self, cache: dict, dlogits: torch.Tensor) -> Tuple[torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor]:
        x = cache['x']  # [B, D]
        a1 = cache['a1']  # [B, H]
        z1 = cache['z1']  # [B, H]

        # gradients for W2, b2
        dW2 = a1.t() @ dlogits  # [H,10]
        db2 = dlogits.sum(dim=0)  # [10]
        # backprop through linear2
        da1 = dlogits @ self.W2.t()  # [B,H]
        # backprop through ReLU
        dz1 = da1.clone()
        dz1[z1 <= 0] = 0.0
        # gradients for W1, b1
        dW1 = x.t() @ dz1  # [D,H]
        db1 = dz1.sum(dim=0)  # [H]
        return dW1, db1, dW2, db2

    def update(self, grads: Tuple[torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor], lr: float):
        dW1, db1, dW2, db2 = grads
        # L2 regularization on weights only
        if self.cfg.l2 > 0:
            dW1 = dW1 + self.cfg.l2 * self.W1
            dW2 = dW2 + self.cfg.l2 * self.W2

        mu = self.cfg.momentum
        # momentum SGD
        self.vW1 = mu * self.vW1 - lr * dW1
        self.vb1 = mu * self.vb1 - lr * db1
        self.vW2 = mu * self.vW2 - lr * dW2
        self.vb2 = mu * self.vb2 - lr * db2

        self.W1 = self.W1 + self.vW1
        self.b1 = self.b1 + self.vb1
        self.W2 = self.W2 + self.vW2
        self.b2 = self.b2 + self.vb2

    @torch.no_grad()
    def accuracy(self, x: torch.Tensor, y: torch.Tensor, batch_size: int = 512) -> float:
        device = self.device
        correct = 0
        total = 0
        for xb, yb in iterate_minibatches(x, y, batch_size=batch_size, shuffle=False):
            xb = xb.to(device)
            yb = yb.to(device)
            logits, _ = self.forward(xb)
            pred = torch.argmax(logits, dim=1)
            correct += (pred == yb).sum().item()
            total += yb.numel()
        return correct / total


def train(
    data_dir: str,
    device: torch.device,
    epochs: int = 10,
    batch_size: int = 128,
    lr: float = 0.1,
    hidden: int = 256,
    normalize: bool = False,
    augment_shift: int = 0,
    save_path: str = 'mlp_mnist.pt',
):
    x_tr, y_tr, x_val, y_val, x_te, y_te = load_mnist_from_dir(data_dir, normalize=normalize)

    cfg = MLPConfig(hidden_dim=hidden)
    model = MLPManual(cfg, device)

    for epoch in range(1, epochs + 1):
        # training loop
        running_loss = 0.0
        steps = 0
        for xb, yb in iterate_minibatches(x_tr, y_tr, batch_size=batch_size, shuffle=True):
            xb = xb.to(device)
            yb = yb.to(device)
            if augment_shift > 0:
                xb = random_shift(xb, max_shift=augment_shift)
            logits, cache = model.forward(xb)
            loss, dlogits = MLPManual.softmax_cross_entropy_with_logits(logits, yb)
            grads = model.backward(cache, dlogits)
            model.update(grads, lr=lr)

            running_loss += loss.item()
            steps += 1

        val_acc = model.accuracy(x_val, y_val)
        print(f"Epoch {epoch:02d} | loss {running_loss/steps:.4f} | val_acc {val_acc*100:.2f}%")

    # final test
    test_acc = model.accuracy(x_te, y_te)
    print(f"Test accuracy: {test_acc*100:.2f}%")

    # save model
    torch.save({
        'W1': model.W1.cpu(), 'b1': model.b1.cpu(), 'W2': model.W2.cpu(), 'b2': model.b2.cpu(),
        'cfg': cfg.__dict__
    }, save_path)
    print(f"Model saved to {save_path}")


def evaluate(save_path: str, data_dir: str, device: torch.device, normalize: bool = False):
    ckpt = torch.load(save_path, map_location='cpu')
    cfg = MLPConfig(**ckpt['cfg'])
    model = MLPManual(cfg, device)
    model.W1 = ckpt['W1'].to(device)
    model.b1 = ckpt['b1'].to(device)
    model.W2 = ckpt['W2'].to(device)
    model.b2 = ckpt['b2'].to(device)
    x_tr, y_tr, x_val, y_val, x_te, y_te = load_mnist_from_dir(data_dir, normalize=normalize)
    print(f"Val acc: {model.accuracy(x_val, y_val)*100:.2f}% | Test acc: {model.accuracy(x_te, y_te)*100:.2f}%")


def self_test(device: torch.device):
    torch.manual_seed(0)
    B = 32
    x = torch.rand(B, 1, 28, 28)
    y = torch.randint(0, 10, (B,))
    model = MLPManual(MLPConfig(hidden_dim=32), device)
    logits, cache = model.forward(x.to(device))
    loss, dlogits = MLPManual.softmax_cross_entropy_with_logits(logits, y.to(device))
    grads = model.backward(cache, dlogits)
    model.update(grads, lr=0.1)
    print("Self-test ran successfully. Loss=", float(loss))


def parse_args():
    p = argparse.ArgumentParser(description="MNIST BP (manual) with pure tensor ops")
    p.add_argument('--data-dir', type=str, default='MNIST_data', help='Path to dir with MNIST gzip files')
    p.add_argument('--epochs', type=int, default=10)
    p.add_argument('--batch-size', type=int, default=128)
    p.add_argument('--lr', type=float, default=0.1)
    p.add_argument('--hidden', type=int, default=256)
    p.add_argument('--normalize', action='store_true')
    p.add_argument('--augment-shift', type=int, default=0, help='Random integer shift in pixels (0 to disable)')
    p.add_argument('--cuda', action='store_true', help='Use CUDA if available')
    p.add_argument('--eval-only', action='store_true')
    p.add_argument('--model', type=str, default='mlp_mnist.pt')
    p.add_argument('--self-test', action='store_true')
    return p.parse_args()


def main():
    args = parse_args()
    device = torch.device('cuda' if args.cuda and torch.cuda.is_available() else 'cpu')
    if args.self_test:
        self_test(device)
        return
    if args.eval_only:
        evaluate(args.model, args.data_dir, device, normalize=args.normalize)
        return
    train(
        data_dir=args.data_dir,
        device=device,
        epochs=args.epochs,
        batch_size=args.batch_size,
        lr=args.lr,
        hidden=args.hidden,
        normalize=args.normalize,
        augment_shift=args.augment_shift,
        save_path=args.model,
    )


if __name__ == '__main__':
    main()

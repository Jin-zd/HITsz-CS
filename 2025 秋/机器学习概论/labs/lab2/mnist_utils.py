import gzip
import os
import struct
from typing import Tuple

import torch


def _read_idx_images_gz(path: str) -> torch.Tensor:
    """
    Read MNIST idx3-ubyte.gz images.
    Returns float32 tensor in [0,1] with shape [N, 1, 28, 28].
    """
    with gzip.open(path, 'rb') as f:
        magic, num, rows, cols = struct.unpack('>IIII', f.read(16))
        if magic != 2051:
            raise ValueError(f"Invalid magic number {magic} for images: {path}")
        buf = f.read(rows * cols * num)
        data = torch.frombuffer(buf, dtype=torch.uint8)
        data = data.to(torch.float32).view(num, 1, rows, cols) / 255.0
    return data


def _read_idx_labels_gz(path: str) -> torch.Tensor:
    """
    Read MNIST idx1-ubyte.gz labels.
    Returns int64 tensor with shape [N].
    """
    with gzip.open(path, 'rb') as f:
        magic, num = struct.unpack('>II', f.read(8))
        if magic != 2049:
            raise ValueError(f"Invalid magic number {magic} for labels: {path}")
        buf = f.read(num)
        labels = torch.frombuffer(buf, dtype=torch.uint8).to(torch.int64)
    return labels


def load_mnist_from_dir(
    data_dir: str,
    normalize: bool = False,
) -> Tuple[torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor]:
    """
    Load MNIST from gzip idx files in a directory.

    Expected files:
      - train-images-idx3-ubyte.gz
      - train-labels-idx1-ubyte.gz
      - t10k-images-idx3-ubyte.gz
      - t10k-labels-idx1-ubyte.gz

    Returns:
      (x_train, y_train, x_val, y_val, x_test, y_test)
      where train is first 55k, val next 5k of original 60k train set.
    """
    img_train_p = os.path.join(data_dir, 'train-images-idx3-ubyte.gz')
    lab_train_p = os.path.join(data_dir, 'train-labels-idx1-ubyte.gz')
    img_test_p = os.path.join(data_dir, 't10k-images-idx3-ubyte.gz')
    lab_test_p = os.path.join(data_dir, 't10k-labels-idx1-ubyte.gz')

    if not (os.path.isfile(img_train_p) and os.path.isfile(lab_train_p) and os.path.isfile(img_test_p) and os.path.isfile(lab_test_p)):
        raise FileNotFoundError(
            f"MNIST gzip files not found in {data_dir}. Ensure four files exist."
        )

    images = _read_idx_images_gz(img_train_p)
    labels = _read_idx_labels_gz(lab_train_p)
    x_test = _read_idx_images_gz(img_test_p)
    y_test = _read_idx_labels_gz(lab_test_p)

    if images.shape[0] != 60000 or labels.shape[0] != 60000:
        # Some distributions may already be 55k train + 5k val; handle generically
        n = images.shape[0]
        n_train = int(n * 11 / 12)  # approx 55k when n=60k
    else:
        n_train = 55000
    x_train = images[:n_train]
    y_train = labels[:n_train]
    x_val = images[n_train:]
    y_val = labels[n_train:]

    if normalize:
        # Standard MNIST mean/std in [0,1]
        mean = 0.1307
        std = 0.3081
        x_train = (x_train - mean) / std
        x_val = (x_val - mean) / std
        x_test = (x_test - mean) / std

    return x_train, y_train, x_val, y_val, x_test, y_test


def iterate_minibatches(
    x: torch.Tensor,
    y: torch.Tensor,
    batch_size: int,
    shuffle: bool = True,
):
    """Simple mini-batch iterator yielding (x_b, y_b). CPU tensors are fine; move to device later."""
    n = x.shape[0]
    indices = torch.arange(n)
    if shuffle:
        perm = torch.randperm(n)
        indices = indices[perm]
    for start in range(0, n, batch_size):
        end = min(start + batch_size, n)
        batch_idx = indices[start:end]
        yield x[batch_idx], y[batch_idx]


def random_shift(images: torch.Tensor, max_shift: int = 2) -> torch.Tensor:
    """
    Apply random integer translation in x/y within [-max_shift, max_shift].
    images: [B, 1, 28, 28] on any device. Zero padding.
    Returns shifted images with same shape (new tensor).
    """
    if max_shift <= 0:
        return images
    B, C, H, W = images.shape
    device = images.device
    dtype = images.dtype
    out = torch.zeros_like(images)
    # generate shifts per-image
    # Use CPU random then send to device to avoid non-deterministic CUDA RNG if not seeded
    dx = torch.randint(-max_shift, max_shift + 1, (B,), device=device)
    dy = torch.randint(-max_shift, max_shift + 1, (B,), device=device)
    for i in range(B):
        sx, sy = int(dx[i].item()), int(dy[i].item())
        x0_src = max(0, -sx)
        x0_dst = max(0, sx)
        y0_src = max(0, -sy)
        y0_dst = max(0, sy)
        x_len = min(H - x0_src, H - x0_dst)
        y_len = min(W - y0_src, W - y0_dst)
        if x_len <= 0 or y_len <= 0:
            continue
        out[i, :, x0_dst:x0_dst + x_len, y0_dst:y0_dst + y_len] = images[
            i, :, x0_src:x0_src + x_len, y0_src:y0_src + y_len
        ]
    return out

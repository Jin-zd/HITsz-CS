import os
import torch
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F
from torch.optim.lr_scheduler import _LRScheduler
import argparse
import numpy as np
from model import DeepLabV3Plus
from dataset import get_voc_dataloaders, get_num_classes
from torch.utils.tensorboard import SummaryWriter
from utils import calculate_metrics
import time
from tqdm import tqdm
        

# PolyLR 学习率调度器
class PolyLR(_LRScheduler):
    def __init__(self, optimizer, max_iters, power=0.9, last_epoch=-1):
        self.max_iters = max_iters
        self.power = power
        super(PolyLR, self).__init__(optimizer, last_epoch)
        
    def get_lr(self):
        return [base_lr * (1 - self.last_epoch / self.max_iters) ** self.power
                for base_lr in self.base_lrs]


def train(args):
    # 设置随机种子以确保可重复性
    torch.manual_seed(args.seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed(args.seed)
        torch.backends.cudnn.deterministic = True
    
    # 创建保存模型的目录
    os.makedirs(args.save_dir, exist_ok=True)
    
    # 设置设备
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    print(f"Using device: {device}")
    
    # 初始化TensorBoard写入器
    writer = SummaryWriter(log_dir=os.path.join(args.save_dir, 'logs'))
    
    # 获取VOC数据集类别数量
    num_classes = get_num_classes()
    
    # 加载模型
    print("Initializing model...")
    model = DeepLabV3Plus(n_channels=3, n_classes=num_classes)
    model = model.to(device)
    
    # 获取数据加载器
    print("Loading data...")
    train_loader, val_loader, test_loader = get_voc_dataloaders(
        root_dir=args.data_root,
        batch_size=args.batch_size,
        num_workers=args.num_workers,
        val_ratio=args.val_ratio,
        download=args.download
    )
    
    # 定义优化器和损失函数
    print("Setting up optimizer and loss function...")
    optimizer = optim.AdamW(model.parameters(), lr=args.lr, weight_decay=args.weight_decay)
    criterion = nn.CrossEntropyLoss(ignore_index=255)
    total_iterations = len(train_loader) * args.epochs
    scheduler = PolyLR(optimizer, max_iters=total_iterations, power=0.9)
    
    # 训练循环
    print("Starting training...")
    best_miou = 0.0  # 使用 mIoU 来跟踪最佳模型
    for epoch in range(args.epochs):
        print(f"Epoch {epoch+1}/{args.epochs}")
        start_time = time.time()
        
        # 训练模式
        model.train()
        train_loss = 0.0
        train_samples = 0
        
        print("Training...")
        for images, masks in tqdm(train_loader, desc="Training", unit="batch"):
            images = images.to(device)
            masks = masks.to(device)
            
            # 清零梯度
            optimizer.zero_grad()
            
            # 前向传播
            outputs = model(images)
            
            # 计算损失
            loss = criterion(outputs, masks)
            
            # 反向传播和优化
            loss.backward()
            optimizer.step()

            # 更新学习率调度器
            scheduler.step()
            writer.add_scalar('Learning Rate', optimizer.param_groups[0]["lr"], epoch)
            
            # 更新统计
            train_loss += loss.item() * images.size(0)
            train_samples += images.size(0)
        
        # 计算平均训练损失
        train_loss = train_loss / train_samples
        
        # 验证模式
        model.eval()
        val_loss = 0.0
        val_samples = 0
        
        # 初始化混淆矩阵用于计算指标
        confusion_matrix = np.zeros((num_classes, num_classes), dtype=np.int64)
        
        with torch.no_grad():
            print("Validation...")
            for images, masks in tqdm(val_loader, desc="Validation", unit="batch"):
                images = images.to(device)
                masks = masks.to(device)
                
                # 前向传播
                outputs = model(images)
                
                # 计算损失
                loss = criterion(outputs, masks)
                
                # 计算预测
                _, preds = torch.max(outputs, 1)
                
                # 更新混淆矩阵
                for j in range(masks.size(0)):
                    mask_flat = masks[j].cpu().numpy().flatten()
                    pred_flat = preds[j].cpu().numpy().flatten()
                    confusion_matrix = calculate_metrics.update_confusion_matrix(
                        confusion_matrix, 
                        mask_flat,
                        pred_flat,
                        num_classes
                    )
                
                # 更新损失统计
                val_loss += loss.item() * images.size(0)
                val_samples += images.size(0)
        
        # 计算平均验证损失
        val_loss = val_loss / val_samples
        
        # 计算评估指标
        class_iou, mean_iou, pixel_acc, mean_pixel_acc = calculate_metrics.calculate_from_confusion_matrix(confusion_matrix)
        
        # 记录到TensorBoard
        writer.add_scalar('Loss/train', train_loss, epoch)
        writer.add_scalar('Loss/validation', val_loss, epoch)
        writer.add_scalar('Metrics/mIoU', mean_iou, epoch)
        writer.add_scalar('Metrics/pixelAcc', pixel_acc, epoch)
        writer.add_scalar('Metrics/meanPixelAcc', mean_pixel_acc, epoch)
        
        # 打印统计
        end_time = time.time()
        epoch_mins, epoch_secs = divmod(end_time - start_time, 60)
        print(f"Epoch {epoch+1}/{args.epochs} completed in {epoch_mins:.0f}m {epoch_secs:.0f}s")
        print(f"Train Loss: {train_loss:.4f}, Validation Loss: {val_loss:.4f}")
        print(f"Mean IoU: {mean_iou:.4f}, Pixel Acc: {pixel_acc:.4f}, Mean Pixel Acc: {mean_pixel_acc:.4f}")
        
        # 保存最佳模型 (使用 mIoU )
        if mean_iou > best_miou:
            best_miou = mean_iou
            torch.save(model.state_dict(), os.path.join(args.save_dir, 'best_model.pth'))
            print(f"Saved best model checkpoint with mIoU: {mean_iou:.4f}!")
        
        # 定期保存模型
        if (epoch + 1) % args.save_freq == 0:
            torch.save(model.state_dict(), os.path.join(args.save_dir, f'checkpoint_epoch_{epoch+1}.pth'))
    
    # 关闭TensorBoard写入器
    writer.close()
    
    # 保存最终模型
    torch.save(model.state_dict(), os.path.join(args.save_dir, 'final_model.pth'))
    print("Training completed!")

def parse_args():
    parser = argparse.ArgumentParser(description='Train DeepLabV3Plus on PASCAL VOC 2012 dataset for semantic segmentation')
    parser.add_argument('--data-root', type=str, default=None, help='PASCAL VOC dataset root directory (if not provided, will download to ./data/voc)')
    parser.add_argument('--save-dir', type=str, default='./checkpoints', help='Directory to save models')
    parser.add_argument('--batch-size', type=int, default=8, help='Batch size for training')
    parser.add_argument('--epochs', type=int, default=100, help='Number of epochs to train')
    parser.add_argument('--lr', type=float, default=1e-4, help='Learning rate')
    parser.add_argument('--weight-decay', type=float, default=5e-5, help='Weight decay')
    parser.add_argument('--num-workers', type=int, default=4, help='Number of data loading workers')
    parser.add_argument('--seed', type=int, default=42, help='Random seed for reproducibility')
    parser.add_argument('--save-freq', type=int, default=10, help='Frequency of saving checkpoints (epochs)')
    parser.add_argument('--val-ratio', type=float, default=0.1, help='Ratio of validation set split from training set')
    parser.add_argument('--download', type=bool, default=True, help='Download the dataset if not exists')
    return parser.parse_args()

if __name__ == '__main__':
    args = parse_args()
    train(args)
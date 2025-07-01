import os
import torch
import torch.nn as nn
import argparse
import numpy as np
from model import DeepLabV3Plus
from dataset import get_voc_dataloader, get_num_classes, get_class_names
from utils import save_predictions, calculate_metrics

def evaluate(args):
    # 设置设备
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    print(f"Using device: {device}")
    
    # 获取VOC数据集类别数量
    num_classes = get_num_classes()
    class_names = get_class_names()
    
    # 加载模型
    model = DeepLabV3Plus(n_channels=3, n_classes=num_classes)
    
    # 加载预训练权重
    if os.path.exists(args.model_path):
        model.load_state_dict(torch.load(args.model_path, map_location=device))
        print(f"Loaded model from {args.model_path}")
    else:
        print(f"No model found at {args.model_path}, initializing with random weights")
    
    model = model.to(device)
    model.eval()
    
    # 获取验证集数据加载器
    val_loader = get_voc_dataloader(
        root_dir=args.data_root,
        batch_size=args.batch_size,
        num_workers=args.num_workers,
        split='val',
        download=args.download
    )
    
    # 定义损失函数
    criterion = nn.CrossEntropyLoss(ignore_index=255)
    
    # 评估模型
    total_loss = 0.0
    total_samples = 0
    
    # 指标计算
    confusion_matrix = np.zeros((num_classes, num_classes), dtype=np.int64)
    
    with torch.no_grad():
        print("Evaluating model...")
        for i, (images, masks) in enumerate(val_loader):
            images = images.to(device)
            masks = masks.to(device)
            
            # 前向传播
            outputs = model(images)
            
            # 计算损失
            loss = criterion(outputs, masks)
            
            # 更新统计
            total_loss += loss.item() * images.size(0)
            total_samples += images.size(0)
            
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
            
            # 保存一些预测结果作为示例
            if i < args.num_visualize and args.save_dir:
                os.makedirs(args.save_dir, exist_ok=True)
                save_predictions(
                    images.cpu(),
                    masks.cpu(),
                    preds.cpu(),
                    os.path.join(args.save_dir, f'batch_{i}'),
                    class_names
                )
    
    # 计算平均损失
    avg_loss = total_loss / total_samples
    print(f"Validation Loss: {avg_loss:.4f}")
    
    # 计算指标
    class_iou, mean_iou, pixel_acc, mean_pixel_acc = calculate_metrics.calculate_from_confusion_matrix(confusion_matrix)
    
    print(f"Per-class IoU:")
    for i, iou_value in enumerate(class_iou):
        print(f"  Class {i} ({class_names[i] if i < len(class_names) else 'Unknown'}): {iou_value:.4f}")
    
    print(f"Mean IoU: {mean_iou:.4f}")
    print(f"Pixel Accuracy: {pixel_acc:.4f}")
    print(f"Mean Pixel Accuracy: {mean_pixel_acc:.4f}")
    
    return avg_loss, mean_iou, pixel_acc, mean_pixel_acc


def parse_args():
    parser = argparse.ArgumentParser(description='Evaluate DeepLabV3Plus on PASCAL VOC 2012 dataset for semantic segmentation')
    parser.add_argument('--data-root', type=str, default=None, help='PASCAL VOC dataset root directory (if not provided, will download to ~/data/voc)')
    parser.add_argument('--model-path', type=str, required=True, help='Path to the trained model checkpoint')
    parser.add_argument('--save-dir', type=str, default='./predictions', help='Directory to save predictions')
    parser.add_argument('--batch-size', type=int, default=8, help='Batch size for evaluation')
    parser.add_argument('--num-workers', type=int, default=4, help='Number of data loading workers')
    parser.add_argument('--num-visualize', type=int, default=5, help='Number of batches to visualize')
    parser.add_argument('--download', type=bool, default=True, help='Download the dataset if not exists')
    return parser.parse_args()

if __name__ == '__main__':
    args = parse_args()
    evaluate(args)
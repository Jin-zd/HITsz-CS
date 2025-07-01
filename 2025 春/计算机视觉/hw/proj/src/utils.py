import os
import numpy as np
import matplotlib.pyplot as plt
import torchvision.transforms as transforms

class calculate_metrics:
    @staticmethod
    def update_confusion_matrix(confusion_matrix, gt_flat, pred_flat, num_classes):
        """更新混淆矩阵"""
        mask = (gt_flat >= 0) & (gt_flat < num_classes)
        hist = np.bincount(
            num_classes * gt_flat[mask].astype(int) + pred_flat[mask],
            minlength=num_classes ** 2
        ).reshape(num_classes, num_classes)
        return confusion_matrix + hist

    @staticmethod
    def calculate_from_confusion_matrix(confusion_matrix):
        """从混淆矩阵中计算评估指标"""
        # 计算每个类别的IoU
        intersection = np.diag(confusion_matrix)
        union = np.sum(confusion_matrix, axis=1) + np.sum(confusion_matrix, axis=0) - intersection
        class_iou = intersection / (union + 1e-10)
        
        # 计算平均IoU (mIoU)
        mean_iou = np.mean(class_iou)
        
        # 计算像素精度 (Pixel Accuracy)
        pixel_accuracy = np.sum(intersection) / (np.sum(confusion_matrix) + 1e-10)
        
        # 计算每个类别的像素精度
        class_accuracy = intersection / (np.sum(confusion_matrix, axis=1) + 1e-10)
        
        # 计算平均像素精度 (Mean Pixel Accuracy)
        mean_pixel_accuracy = np.mean(class_accuracy)
        
        return class_iou, mean_iou, pixel_accuracy, mean_pixel_accuracy


def save_predictions(images, masks, predictions, save_path, class_names=None):
    """保存模型预测结果为可视化图像"""
    os.makedirs(save_path, exist_ok=True)
    
    # 如果没有提供类别名称，使用默认设置
    if class_names is None:
        # 导入这里防止循环导入
        from src.dataset import get_class_names
        class_names = get_class_names()
    
    # 创建颜色映射
    num_classes = len(class_names)
    cmap = get_color_map(num_classes)
    
    # 反归一化图像
    inv_normalize = transforms.Normalize(
        mean=[-0.485/0.229, -0.456/0.224, -0.406/0.225],
        std=[1/0.229, 1/0.224, 1/0.225]
    )
    
    for i in range(min(images.size(0), 8)):  # 最多保存8张图像
        plt.figure(figsize=(15, 5))
        
        # 显示原图
        img = inv_normalize(images[i]).numpy().transpose(1, 2, 0)
        img = np.clip(img, 0, 1)
        plt.subplot(1, 3, 1)
        plt.imshow(img)
        plt.title('Original Image')
        plt.axis('off')
        
        # 显示真实标签
        mask = masks[i].numpy()
        plt.subplot(1, 3, 2)
        plt.imshow(mask, cmap=cmap, vmin=0, vmax=num_classes-1)
        plt.title('Ground Truth')
        plt.axis('off')
        
        # 显示预测结果
        pred = predictions[i].numpy()
        plt.subplot(1, 3, 3)
        plt.imshow(pred, cmap=cmap, vmin=0, vmax=num_classes-1)
        plt.title('Prediction')
        plt.axis('off')
        
        # 保存图像
        plt.savefig(os.path.join(save_path, f'sample_{i}.png'))
        plt.close()

def get_color_map(n):
    """创建n个类别的颜色映射"""
    cmap = plt.cm.get_cmap('tab20', n)
    return cmap

def create_pascal_voc_label_colormap():
    """创建PASCAL VOC数据集标签的颜色映射
    
    Returns:
        一个长度为256的numpy数组，包含PASCAL VOC的颜色映射
        每个类别对应一个颜色 [R, G, B]
    """
    colormap = np.zeros((256, 3), dtype=np.uint8)
    # 标准的PASCAL VOC颜色映射
    ind = np.arange(256, dtype=np.uint8)
    for shift in range(8):
        for channel in range(3):
            colormap[:, channel] |= ((ind >> channel) & 1) << (7 - shift)
        ind >>= 3
    return colormap

def label_to_color_image(label, colormap=None):
    """将标签映射为彩色图像"""
    if label.ndim != 2:
        raise ValueError('Expect 2-D input label')
    
    if colormap is None:
        colormap = create_pascal_voc_label_colormap()
    
    if np.max(label) >= len(colormap):
        raise ValueError('Label value too large.')
    
    return colormap[label]
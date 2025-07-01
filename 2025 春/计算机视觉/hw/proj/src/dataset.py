import os
import torch
import numpy as np
from PIL import Image
from PIL import ImageFilter
import torchvision.transforms as transforms
from torch.utils.data import Dataset, DataLoader, random_split
import torchvision.transforms.functional as TF
import random
from torchvision.datasets import VOCSegmentation

# VOC数据集的类别
VOC_CLASSES = [
    'background', 'aeroplane', 'bicycle', 'bird', 'boat', 'bottle', 
    'bus', 'car', 'cat', 'chair', 'cow', 'diningtable', 'dog', 
    'horse', 'motorbike', 'person', 'pottedplant', 'sheep', 'sofa', 
    'train', 'tvmonitor'
]

class VOCSegmentationDataset(Dataset):
    def __init__(self, root_dir=None, split='train', transform=None, download=True):
        """
        PASCAL VOC数据集语义分割加载器
        Args:
            root_dir (string): VOC数据集根目录，如果为None则使用默认路径
            split (string): 'train', 'val', 或 'test'
            transform (callable, optional): 可选的数据变换
            download (bool): 如果为True且数据集不存在，则下载
        """
        if root_dir is None:
            # 如果未提供路径，使用默认路径
            root_dir = os.path.expanduser('./data/voc')
        
        # 创建目录（如果不存在）
        os.makedirs(root_dir, exist_ok=True)
            
        # 初始化VOC数据集
        self.voc_dataset = VOCSegmentation(
            root=root_dir,
            year='2012',
            image_set=split,
            download=download,
            transform=None,
            target_transform=None
        )
        
        self.transform = transform
        self.split = split
        
        print(f"Loaded {len(self.voc_dataset)} images from VOC2012 {split} split")
    
    def __len__(self):
        return len(self.voc_dataset)
    
    def __getitem__(self, index):
        img, mask = self.voc_dataset[index]
        
        # 将PIL图像转换为RGB模式
        img = img.convert('RGB')
        
        # VOC分割掩码是PIL图像，需要转换为有类别ID的掩码
        mask = self._convert_voc_mask(mask)
        
        # 应用转换
        if self.transform is not None:
            img, mask = self.transform(img, mask)
        else:
            # 默认的转换
            img = transforms.ToTensor()(img)
            mask = torch.from_numpy(np.array(mask)).long()
        
        return img, mask
    
    def _convert_voc_mask(self, mask_pil):
        """直接返回VOC原始mask（类别ID），不做任何映射"""
        return mask_pil

class VOCTransform:
    def __init__(self, size=(512, 512), train=True):
        """
        Args:
            size (tuple): 目标大小 (高度, 宽度)
            train (bool): 是否为训练模式
        """
        self.size = size
        self.train = train

    def __call__(self, image, mask):
        """
        应用转换到图像和掩码
        Args:
            image: PIL图像或张量
            mask: PIL掩码或张量
        Returns:
            转换后的图像和掩码张量
        """
        # 确保输入是PIL图像
        if isinstance(image, torch.Tensor):
            image = transforms.ToPILImage()(image)
        if isinstance(mask, torch.Tensor):
            mask = Image.fromarray(mask.numpy().astype(np.uint8))

        # 仅训练时做数据增强
        if self.train:
            # 随机旋转
            angle = random.uniform(-10, 10)
            image = TF.rotate(image, angle, interpolation=Image.BILINEAR)
            mask = TF.rotate(mask, angle, interpolation=Image.NEAREST)

            # 随机色彩抖动
            color_jitter = transforms.ColorJitter(
                brightness=0.3, contrast=0.3, saturation=0.3, hue=0.1)
            image = color_jitter(image)

            # 随机高斯模糊
            if random.random() > 0.7:
                image = image.filter(ImageFilter.GaussianBlur(radius=random.uniform(0, 1.5)))

            # 随机裁剪
            i, j, h, w = transforms.RandomResizedCrop.get_params(
                image, scale=(0.7, 1.0), ratio=(0.9, 1.1))
            image = TF.resized_crop(image, i, j, h, w, self.size, interpolation=Image.BILINEAR)
            mask = TF.resized_crop(mask, i, j, h, w, self.size, interpolation=Image.NEAREST)
        else:
            # 统一resize
            image = image.resize(self.size, Image.BILINEAR)
            mask = mask.resize(self.size, Image.NEAREST)

        # 仅训练时做随机水平翻转
        if self.train and random.random() > 0.5:
            image = TF.hflip(image)
            mask = TF.hflip(mask)

        # 转为张量
        image = TF.to_tensor(image)
        mask = torch.from_numpy(np.array(mask)).long()

        # 标准化
        image = TF.normalize(image, mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])

        return image, mask

def get_voc_dataloader(root_dir=None, batch_size=8, num_workers=4, split='train', download=True):
    """
    获取PASCAL VOC数据集的数据加载器
    
    Args:
        root_dir (string): PASCAL VOC数据集根目录，如果为None则自动下载到默认位置
        batch_size (int): 每批数据的样本数量
        num_workers (int): 数据加载的工作进程数
        split (string): 'train', 'val', 或 'test'
        download (bool): 是否下载数据集（如果不存在）
        
    Returns:
        DataLoader: PyTorch数据加载器
    """
    train_mode = (split == 'train')
    transform = VOCTransform(size=(512, 512), train=train_mode)
    
    dataset = VOCSegmentationDataset(
        root_dir=root_dir,
        split=split,
        transform=transform,
        download=download
    )
    
    dataloader = DataLoader(
        dataset,
        batch_size=batch_size,
        shuffle=train_mode,
        num_workers=num_workers,
        pin_memory=True,
        drop_last=train_mode
    )
    
    return dataloader

def get_voc_dataloaders(root_dir=None, batch_size=8, num_workers=4, val_ratio=0.1, download=True):
    """
    获取PASCAL VOC数据集的训练、验证和测试数据加载器
    
    Args:
        root_dir (string): PASCAL VOC数据集根目录，如果为None则自动下载到默认位置
        batch_size (int): 每批数据的样本数量
        num_workers (int): 数据加载的工作进程数
        val_ratio (float): 从训练集中划分出的验证集比例
        download (bool): 是否下载数据集（如果不存在）
        
    Returns:
        tuple: (训练数据加载器, 验证数据加载器, 测试数据加载器)
    """
    train_transform = VOCTransform(size=(512, 512), train=True)
    val_transform = VOCTransform(size=(512, 512), train=False)
    
    # 加载训练数据集
    full_train_dataset = VOCSegmentationDataset(
        root_dir=root_dir,
        split='train',
        transform=None,  # 我们将在每个拆分后应用变换
        download=download
    )
    
    # 计算验证集的大小
    val_size = int(len(full_train_dataset) * val_ratio)
    train_size = len(full_train_dataset) - val_size
    
    # 随机拆分训练集和验证集
    train_dataset, val_dataset = random_split(
        full_train_dataset, 
        [train_size, val_size],
        generator=torch.Generator().manual_seed(42)  # 设置随机种子以确保可重复性
    )
    
    # 创建自定义数据集，以应用适当的变换
    class TransformDataset(Dataset):
        def __init__(self, dataset, transform):
            self.dataset = dataset
            self.transform = transform
            
        def __len__(self):
            return len(self.dataset)
            
        def __getitem__(self, index):
            img, mask = self.dataset[index]
            if self.transform:
                img, mask = self.transform(img, mask)
            return img, mask
    
    train_dataset = TransformDataset(train_dataset, train_transform)
    val_dataset = TransformDataset(val_dataset, val_transform)
    
    # 加载测试集
    test_dataset = VOCSegmentationDataset(
        root_dir=root_dir,
        split='val',  # VOC使用'val'作为测试集
        transform=val_transform,
        download=download
    )
    
    print(f"Dataset split: {train_size} training, {val_size} validation, {len(test_dataset)} test images")
    
    # 创建数据加载器
    train_loader = DataLoader(
        train_dataset,
        batch_size=batch_size,
        shuffle=True,
        num_workers=num_workers,
        pin_memory=True,
        drop_last=True
    )
    
    val_loader = DataLoader(
        val_dataset,
        batch_size=batch_size,
        shuffle=False,
        num_workers=num_workers,
        pin_memory=True
    )
    
    test_loader = DataLoader(
        test_dataset,
        batch_size=batch_size,
        shuffle=False,
        num_workers=num_workers,
        pin_memory=True
    )
    
    return train_loader, val_loader, test_loader

def get_num_classes():
    """返回VOC数据集的类别数量"""
    return len(VOC_CLASSES)

def get_class_names():
    """返回VOC数据集的类别名称"""
    return VOC_CLASSES
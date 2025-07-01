import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.models as models
from torchvision.models import ResNet50_Weights

class ASPP(nn.Module):
    def __init__(self, in_channels, out_channels):
        super(ASPP, self).__init__()
        # 空洞空间金字塔池化模块
        self.conv1 = nn.Conv2d(in_channels, out_channels, 1, bias=False)
        self.bn1 = nn.BatchNorm2d(out_channels)
        
        self.conv2 = nn.Conv2d(in_channels, out_channels, 3, padding=6, dilation=6, bias=False)
        self.bn2 = nn.BatchNorm2d(out_channels)
        
        self.conv3 = nn.Conv2d(in_channels, out_channels, 3, padding=12, dilation=12, bias=False)
        self.bn3 = nn.BatchNorm2d(out_channels)
        
        self.conv4 = nn.Conv2d(in_channels, out_channels, 3, padding=18, dilation=18, bias=False)
        self.bn4 = nn.BatchNorm2d(out_channels)
        
        self.pool = nn.AdaptiveAvgPool2d(1)
        self.conv5 = nn.Conv2d(in_channels, out_channels, 1, bias=False)
        self.bn5 = nn.BatchNorm2d(out_channels)
        
        self.conv_out = nn.Conv2d(out_channels * 5, out_channels, 1, bias=False)
        self.bn_out = nn.BatchNorm2d(out_channels)
        
    def forward(self, x):
        feat1 = F.relu(self.bn1(self.conv1(x)))
        feat2 = F.relu(self.bn2(self.conv2(x)))
        feat3 = F.relu(self.bn3(self.conv3(x)))
        feat4 = F.relu(self.bn4(self.conv4(x)))
        
        feat5 = self.pool(x)
        feat5 = self.conv5(feat5)
        feat5 = self.bn5(feat5)
        feat5 = F.relu(feat5)
        feat5 = F.interpolate(feat5, size=x.size()[2:], mode='bilinear', align_corners=True)
        
        out = torch.cat((feat1, feat2, feat3, feat4, feat5), dim=1)
        out = F.relu(self.bn_out(self.conv_out(out)))
        return out

class DeepLabV3Plus(nn.Module):
    def __init__(self, n_channels=3, n_classes=21, pretrained=True):
        super(DeepLabV3Plus, self).__init__()
        self.n_channels = n_channels
        self.n_classes = n_classes
        
        # 使用ResNet-50作为backbone
        resnet = models.resnet50(weights=ResNet50_Weights.IMAGENET1K_V1 if pretrained else None)
        
        # 编码器
        self.encoder_conv1 = resnet.conv1
        self.encoder_bn1 = resnet.bn1
        self.encoder_relu = resnet.relu
        self.encoder_maxpool = resnet.maxpool
        self.encoder_layer1 = resnet.layer1  # 1/4
        self.encoder_layer2 = resnet.layer2  # 1/8
        self.encoder_layer3 = resnet.layer3  # 1/16
        self.encoder_layer4 = resnet.layer4  # 1/32
        
        # ASPP模块
        self.aspp = ASPP(2048, 256)
        
        # 低层特征转换
        self.low_level_conv = nn.Conv2d(256, 48, 1, bias=False)
        self.low_level_bn = nn.BatchNorm2d(48)
        
        # 解码器
        self.decoder = nn.Sequential(
            nn.Conv2d(304, 256, kernel_size=3, stride=1, padding=1, bias=False),
            nn.BatchNorm2d(256),
            nn.ReLU(),
            nn.Conv2d(256, 256, kernel_size=3, stride=1, padding=1, bias=False),
            nn.BatchNorm2d(256),
            nn.ReLU(),
            nn.Conv2d(256, n_classes, kernel_size=1, stride=1)
        )
        
    def forward(self, x):
        input_size = x.size()[2:]
        
        # 编码器前向传播
        x = self.encoder_conv1(x)  # [B, 64, H/2, W/2]
        x = self.encoder_bn1(x)
        x = self.encoder_relu(x)
        x = self.encoder_maxpool(x)  # [B, 64, H/4, W/4]
        
        low_level_feat = self.encoder_layer1(x)  # [B, 256, H/4, W/4]
        x = self.encoder_layer2(low_level_feat)  # [B, 512, H/8, W/8]
        x = self.encoder_layer3(x)  # [B, 1024, H/16, W/16]
        x = self.encoder_layer4(x)  # [B, 2048, H/32, W/32]
        
        # ASPP特征提取
        x = self.aspp(x)  # [B, 256, H/32, W/32]
        
        # 上采样ASPP特征
        x = F.interpolate(x, size=low_level_feat.size()[2:], mode='bilinear', align_corners=True)
        
        # 低层特征处理
        low_level_feat = self.low_level_conv(low_level_feat)
        low_level_feat = self.low_level_bn(low_level_feat)
        low_level_feat = F.relu(low_level_feat)
        
        # 特征融合
        x = torch.cat((x, low_level_feat), dim=1)
        
        # 解码器
        x = self.decoder(x)
        
        # 上采样到原始图像尺寸
        x = F.interpolate(x, size=input_size, mode='bilinear', align_corners=True)
        
        return x
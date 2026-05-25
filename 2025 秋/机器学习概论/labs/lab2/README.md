# 实验二：BP 神经网络实现 MNIST（纯张量反向传播）

本实现不使用 autograd/nn/optim，也不调用 sklearn/torchvision，手写前向/反向传播与交叉熵，支持 GPU 张量计算（仅用 torch 张量 API）。所有文件均放在 `lab2` 根目录，不使用子文件夹。

## 文件说明
- `mnist_utils.py`：MNIST idx.gz 文件读取、简单批次迭代器、可选随机平移增广。
- `bp_mnist.py`：一层隐藏层 MLP 的手写 BP 训练/评估/保存/加载与命令行入口，含 `--self-test` 自检模式。
- `requirements.txt`：依赖列表（仅 torch, numpy）。

## 数据准备
请将四个 MNIST 压缩文件放到 `MNIST_data/` 目录（已在仓库中建好目录）。
- train-images-idx3-ubyte.gz
- train-labels-idx1-ubyte.gz
- t10k-images-idx3-ubyte.gz
- t10k-labels-idx1-ubyte.gz

## 安装依赖（Windows PowerShell）
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

若有可用 CUDA，可安装带 CUDA 的 torch 轮子（可选）。

## 快速自检
无需数据，验证前后向不报错：
```powershell
python bp_mnist.py --self-test
```

## 开始训练
```powershell
# CPU 训练（默认）
python bp_mnist.py --data-dir MNIST_data --epochs 10 --batch-size 128 --lr 0.1 --hidden 256 --normalize

# 使用 GPU（如有 CUDA）
python bp_mnist.py --data-dir MNIST_data --epochs 10 --batch-size 256 --lr 0.15 --hidden 512 --normalize --cuda

# 启用轻量增广：随机整数平移（-2..2像素）
python bp_mnist.py --data-dir MNIST_data --epochs 12 --augment-shift 2 --normalize
```

训练完成后会输出验证集与测试集准确率，并将权重保存到 `mlp_mnist.pt`。

## 模型评估（加载已保存模型）
```powershell
python bp_mnist.py --eval-only --model mlp_mnist.pt --data-dir MNIST_data --normalize
```

## 参数说明（常用）
- `--epochs`：训练轮数（默认 10）
- `--batch-size`：批大小（默认 128）
- `--lr`：学习率（默认 0.1），已使用 Momentum=0.9 与轻度 L2 正则
- `--hidden`：隐藏层维度（默认 256）
- `--normalize`：使用标准化 (x-0.1307)/0.3081（默认关闭）
- `--augment-shift K`：随机平移增广像素上限（默认 0 表示关闭）
- `--cuda`：如本机支持 CUDA 则启用 GPU

## 设计与实现要点
- 手写前向：Linear-ReLU-Linear；输出 logits。
- 手写损失：稳定的 softmax + 交叉熵（log-sum-exp 形式），返回 `dlogits`。
- 手写反向：按层求梯度，使用 Momentum SGD 和 L2 正则，仅对权重做 L2。
- 评估：按批次计算分类准确率，避免显存溢出。
- 增广：不依赖 torchvision，提供纯张量实现的随机平移。

## 期望效果
使用 `--normalize`、`hidden=256~512`、`batch-size=128~256`、`epochs=10~15`，在 CPU/GPU 上均可达到较好的 MNIST 精度（> 95%+）。

## 常见问题
- 报错“找不到 MNIST gzip 文件”：请确认四个文件位于 `MNIST_data/`。
- 速度慢：可开启 `--cuda`（需安装对应 CUDA 的 torch），或调大学习率与批大小。
- 精度不足：尝试启用 `--normalize`、增加 `--hidden`、增大 `--epochs`，或轻量 `--augment-shift`。

## 参考
MNIST 数据格式说明（idx 文件），以及标准均值和方差：mean=0.1307, std=0.3081。

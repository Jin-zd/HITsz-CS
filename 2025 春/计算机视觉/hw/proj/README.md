训练：
```
python main.py --mode train --data-root ./data/voc --batch-size 32 --epochs 100 --lr 1e-5 --save-dir ./checkpoints
```

测试：
```
python main.py --mode eval --model-path ./checkpoints/best_model.pth --save-dir ./predictions
```

服务器开启 tensorboard：
```
tensorboard --logdir=./checkpoints/logs --port=6006 --bind_all
```
建立端口转发：
```
ssh -L 16006:127.0.0.1:6006 username@ip
```
本地打开 http://localhost:16006 即可查看 tensorboard 界面。
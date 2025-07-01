# coding: utf-8
import sys, os
sys.path.append(os.pardir)
import numpy as np
import matplotlib.pyplot as plt
import time
import random
from dataset.mnist import load_mnist
from simple_convnet import SimpleConvNet
from src.util import *

# 读入数据
(x_train, t_train), (x_test, t_test) = load_mnist(flatten=False)

network = SimpleConvNet(input_dim=(1, 28, 28),
                       conv_param={'filter_num': 30, 'filter_size': 5, 'pad': 0, 'stride': 1},
                       hidden_size=100, output_size=10, weight_init_std=0.01)

train_size = x_train.shape[0]
batch_size = 100
learning_rate = 0.1
print('train size', train_size)

train_loss_list = []
train_acc_list = []
test_acc_list = []

iter_per_epoch = max(train_size / batch_size, 1)
epoch = 5
iters_num = int(iter_per_epoch * epoch)
total_elapsed_time = 0

for i in range(iters_num):
    batch_mask = np.random.choice(train_size, batch_size)
    x_batch = x_train[batch_mask]
    t_batch = t_train[batch_mask]
    
    start = time.time()
    grad = network.gradient(x_batch, t_batch)
    elapsed_time = time.time() - start
    total_elapsed_time += elapsed_time
    
    for key in network.params.keys():
        network.params[key] -= learning_rate * grad[key]
    
    loss = network.loss(x_batch, t_batch)
    train_loss_list.append(loss)
    
    if i % iter_per_epoch == 0:
        train_acc = network.accuracy(x_train, t_train)
        test_acc = network.accuracy(x_test, t_test)
        train_acc_list.append(train_acc)
        test_acc_list.append(test_acc)
        print('epoch {} train acc: {:.4f}, test acc: {:.4f}'.format(int(i / iter_per_epoch), train_acc, test_acc))

print('gradient compute time: ', total_elapsed_time, 's')

sample_test = x_test[0:4]
sample_t_test = t_test[0:4]
sample_y = network.predict(sample_test)
sample_y = np.argmax(sample_y, axis=1)
print('predict label: ', sample_y, 'true label', sample_t_test)

fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2)
ax1.imshow(x_test[0][0], cmap='gray')
ax2.imshow(x_test[1][0], cmap='gray')
ax3.imshow(x_test[2][0], cmap='gray')
ax4.imshow(x_test[3][0], cmap='gray')
plt.show()
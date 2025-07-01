## 均方误差的分解

将预测模型 $\hat{f}(x)$ 的均方误差分解为偏差 (Bias) 的平方、方差 (Variance) 和噪声 (Noise) 三个部分。
$$
\begin{align*}
MSE
&= E[(y - \hat{f}(x))^2] \\ 
&= E[(f(x) + \epsilon - \hat{f}(x))^2] \\
&= E[((f(x) - \hat{f}(x)) + \epsilon)^2] \\
&= E[(f(x) - \hat{f}(x))^2 + 2\epsilon(f(x) - \hat{f}(x)) + \epsilon^2] \\
&= E[(f(x) - \hat{f}(x))^2] + 2E[\epsilon(f(x) - \hat{f}(x))] + E[\epsilon^2]
\end{align*}
$$
由于 $\epsilon$ 与 $\hat{f}(x)$ 相互独立，且 $E[\epsilon] = 0$，因此 $2E[\epsilon(f(x) - \hat{f}(x))] = 2E[\epsilon]E[f(x) - \hat{f}(x)] = 2 \cdot 0 \cdot E[f(x) - \hat{f}(x)] = 0$。同时，$E[\epsilon^2] = \sigma^2$。

所以，

$$
MSE = E[(f(x) - \hat{f}(x))^2] + \sigma^2
$$

接下来，对 $E[(f(x) - \hat{f}(x))^2]$ 这一项进行进一步分解。在其中引入 $E_D[\hat{f}(x)]$ (预测模型的期望值)：

$$
\begin{align*}
E[(f(x) - \hat{f}(x))^2] &= E[(f(x) - E_D[\hat{f}(x)] + E_D[\hat{f}(x)] - \hat{f}(x))^2] \\
&= E[((f(x) - E_D[\hat{f}(x)]) + (E_D[\hat{f}(x)] - \hat{f}(x)))^2] \\
&= E[(f(x) - E_D[\hat{f}(x)])^2 + 2(f(x) - E_D[\hat{f}(x)])(E_D[\hat{f}(x)] \\
&- \hat{f}(x)) + (E_D[\hat{f}(x)] - \hat{f}(x))^2] \\
&= E[(f(x) - E_D[\hat{f}(x)])^2] + 2E[(f(x) \\
&- E_D[\hat{f}(x)])(E_D[\hat{f}(x)] - \hat{f}(x))] + E[(E_D[\hat{f}(x)] - \hat{f}(x))^2]
\end{align*}
$$

由于 $f(x)$ 和 $E_D[\hat{f}(x)]$ 是确定的值（对于给定的 $x$），它们可以从期望中提取出来。因此，中间项为：

$$
2(f(x) - E_D[\hat{f}(x)])E[E_D[\hat{f}(x)] - \hat{f}(x)] = 2(f(x) - E_D[\hat{f}(x)])(E_D[\hat{f}(x)] - E_D[\hat{f}(x)]) = 0
$$

所以，
$$
E[(f(x) - \hat{f}(x))^2] = (f(x) - E_D[\hat{f}(x)])^2 + E[(E_D[\hat{f}(x)] - \hat{f}(x))^2] 
$$

偏差 (Bias): $Bias(\hat{f}(x)) = E_D[\hat{f}(x)] - f(x)$
方差 (Variance): $Var[\hat{f}(x)] = E_D[(\hat{f}(x) - E_D[\hat{f}(x)])^2]$


将上述结果代回 MSE 的表达式，得到：

$$
\begin{align*}
MSE 
&= (f(x) - E_D[\hat{f}(x)])^2 + E[(E_D[\hat{f}(x)] - \hat{f}(x))] + \sigma^2 \\
&= Bias(\hat{f}(x))^2 + Var[\hat{f}(x)] + \sigma^2
\end{align*}
$$

## 三层神经网络反向传播算法推导


$O_i = x_i$: 输入层第 $i$ 个节点的输出等于输入特征 $x_i$，其中 $i = 1, 2, ..., n$，$n$ 为输入特征的数量。
$I_j = \sum_{i=1}^{n} w_{ji} x_i$: 隐藏层第 $j$ 个节点的输入是所有输入层节点输出的加权和，其中 $w_{ji}$ 是输入层第 $i$ 个节点到隐藏层第 $j$ 个节点的权重，$j = 1, 2, ..., m$，$m$ 为隐藏层节点的数量。

$O_j = f(I_j)$: 隐藏层第 $j$ 个节点的输出是其输入的激活函数 $f$ 的结果。这里 $f$ 是 sigmoid 函数，$f(x) = \frac{1}{1 + e^{-x}}$。

$I_k = \sum_{j=1}^{m} w_{kj} O_j$: 输出层第 $k$ 个节点的输入是所有隐藏层节点输出的加权和，其中 $w_{kj}$ 是隐藏层第 $j$ 个节点到输出层第 $k$ 个节点的权重，$k = 1, 2, ..., l$，$l$ 为输出层节点的数量。
$O_k = f(I_k)$: 输出层第 $k$ 个节点的输出是其输入的激活函数 $f$ 的结果。

标函数 (损失函数):
对于单个样本，假设期望输出为 $d_k$，实际输出为 $y_k (= O_k)$:
$$
E = \frac{1}{2} \sum_{k} (d_k - y_k)^2
$$

通过梯度下降法更新权重，使得损失函数最小化。对于输出层权重 $w_{jk}$，其更新规则为：
$$
w_{jk}(t+1) = w_{jk}(t) + \Delta w_{jk}
$$

其中，$\Delta w_{jk} = - \eta \frac{\partial E}{\partial w_{jk}}$，$\eta$ 是学习率。

计算梯度 $\frac{\partial E}{\partial w_{jk}}$:
$$
\begin{align*}
\frac{\partial E}{\partial w_{jk}} &= \frac{\partial E}{\partial O_k} \frac{\partial O_k}{\partial I_k} \frac{\partial I_k}{\partial w_{jk}} \\
&= -(d_k - y_k) \cdot f'(I_k) \cdot O_j \\
&= -\delta_k O_j
\end{align*}
$$
其中，$\delta_k = (d_k - y_k) f'(I_k)$ 是输出层第 $k$ 个节点的误差项。

因此，输出层权重的更新规则为：
$$
w_{jk}(t+1) = w_{jk}(t) + \eta \delta_k O_j
$$
将 $f'(I_k) = f(I_k)(1 - f(I_k)) = y_k(1 - y_k)$ 代入 $\delta_k$，得到：
$$
\delta_k = (d_k - y_k) y_k (1 - y_k)
$$

最终的输出层权重更新规则为：

$$
w_{jk}(t+1) = w_{jk}(t) + \eta (d_k - y_k) y_k (1 - y_k) O_j
$$

对于隐藏层权重 $w_{ij}$（输入层第 $i$ 个节点到隐藏层第 $j$ 个节点的权重），其更新规则为：
$$
w_{ij}(t+1) = w_{ij}(t) + \Delta w_{ij}
$$
其中，$\Delta w_{ij} = - \eta \frac{\partial E}{\partial w_{ij}}$。
计算梯度 $\frac{\partial E}{\partial w_{ij}}$:
$$
\begin{align*}
\frac{\partial E}{\partial w_{ij}} &= \frac{\partial E}{\partial O_j} \frac{\partial O_j}{\partial I_j} \frac{\partial I_j}{\partial w_{ij}} \\
\end{align*}
$$
需要计算 $\frac{\partial E}{\partial O_j}$:
$$
\begin{align*}
\frac{\partial E}{\partial O_j} &= \sum_{k} \frac{\partial E}{\partial I_k} \frac{\partial I_k}{\partial O_j} \\
&= \sum_{k} \frac{\partial}{\partial I_k} \left( \frac{1}{2} (d_k - f(I_k))^2 \right) \frac{\partial}{\partial O_j} \left( \sum_{j'} w_{kj'} O_{j'} \right) \\
&= \sum_{k} -(d_k - y_k) f'(I_k) w_{kj} \\
&= \sum_{k} \delta_k w_{kj}
\end{align*}
$$
接下来计算 $\frac{\partial O_j}{\partial I_j}$ 和 $\frac{\partial I_j}{\partial w_{ij}}$:

$$
\frac{\partial O_j}{\partial I_j} = f'(I_j)
$$

$$
\frac{\partial I_j}{\partial w_{ij}} = \frac{\partial}{\partial w_{ij}} \left( \sum_{i'} w_{ji'} x_{i'} \right) = x_i = O_i
$$

因此，
$$
\begin{align*}
\frac{\partial E}{\partial w_{ij}} &= \left( \sum_{k} \delta_k w_{kj} \right) f'(I_j) O_i \\
&= \delta_j O_i
\end{align*}
$$
其中，$\delta_j = f'(I_j) \sum_{k} \delta_k w_{kj} = O_j (1 - O_j) \sum_{k} \delta_k w_{kj}$ 是隐藏层第 $j$ 个节点的误差项。

最终的隐藏层权重更新规则为：

$$
w_{ij}(t+1) = w_{ij}(t) + \eta \delta_j O_i \\
= w_{ij}(t) + \eta O_j (1 - O_j) \left( \sum_{k} \delta_k w_{kj} \right) O_i
$$
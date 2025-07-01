import math

def E_calculate(n, p, q):
    E = [[0 for _ in range(n + 2)] for _ in range(n + 2)]
    W = [[0 for _ in range(n + 2)] for _ in range(n + 2)]
    root = [[0 for _ in range(n + 1)] for _ in range(n + 1)]
    for i in range(1, n + 2):
        E[i][i - 1] = q[i - 1]
        W[i][i - 1] = q[i - 1]
    for l in range(1, n + 1):
        for i in range(1, n - l + 2):
            j = i + l - 1
            E[i][j] = math.inf
            W[i][j] = W[i][j - 1] + p[j] + q[j]
            for r in range(i, j + 1):
                t = E[i][r - 1] + E[r + 1][j] + W[i][j]
                if t < E[i][j]:
                    E[i][j] = t
                    root[i][j] = r
    return E, root

p = [-1, 0.04, 0.06, 0.08, 0.02, 0.10, 0.12, 0.14]
q = [0.06, 0.06, 0.06, 0.06, 0.05, 0.05, 0.05, 0.05]
E, root = E_calculate(7, p, q)
print(E)
print(root)
def max_value(w, v, n, c):
    dp = [[0 for _ in range(c + 1)] for _ in range(n + 1)]
    for j in range(c + 1):
        dp[n][j] = v[n - 1] * (j // w[n - 1])
    for i in range(n - 1, 0, -1):
        for j in range(c + 1):
            if j < w[i - 1]:
                dp[i][j] = dp[i + 1][j]
            else:
                dp[i][j] = max(dp[i + 1][j], dp[i][j - w[i - 1]] + v[i - 1])
    return dp[1][c]

n = int(input())
c = int(input())
w = []
v = []
for i in range(n):
    w.append(int(input()))
    v.append(int(input()))
print(max_value(w, v, n, c))
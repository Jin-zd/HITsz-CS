def bellman_ford(w_matrix, source, target, k, V):
    d = []
    for i in range(V + 1):
        d.append(float("inf"))
    d[source] = 0
    for i in range(k):
            backup = d.copy()
            for j in range(len(w_matrix)):
                 for l in range(len(w_matrix[0])):
                     if w_matrix[j][l] != float("inf"):
                          d[l] = min(d[l], backup[j] + w_matrix[j][l])
    if d[target] == float("inf"):
        return "impossible"
    return d[target]

n, m, k = [int(x) for x in input().split(" ")]
w_matrix = [[float("inf") for i in range(n + 1)] for j in range(n + 1)]
for i in range(m):
    u, v, w = [int(x) for x in input().split(" ")]
    w_matrix[u][v] = w
result = bellman_ford(w_matrix, 1, n, k, n)
print(result)

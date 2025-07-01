import networkx as nx

G = nx.MultiDiGraph()
n, m = [int(x) for x in input().split(" ")]
t = [int(x) for x in input().split(" ")]
for i in range(m):
    side = [int(x) for x in input().split(" ")]
    G.add_edge(side[0], side[1], weight = side[2] + t[side[1] - 1])
    G.add_edge(side[1], side[0], weight = side[2] + t[side[0] - 1])


path_length = nx.dijkstra_path_length(G, 1, n, weight='weight')
print(path_length)

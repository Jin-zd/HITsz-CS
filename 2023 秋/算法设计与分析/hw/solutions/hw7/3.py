import networkx as nx
import sympy as sp

G = nx.Graph()
n = int(input())
nums = [int(x) for x in input().split(" ")]

for i in range(n):
    for j in range(i, n):
        if sp.isprime(nums[i] + nums[j]):
            G.add_edge(nums[i], nums[j])

match = nx.bipartite.maximum_matching(G)
print(len(match.keys()) // 2)     


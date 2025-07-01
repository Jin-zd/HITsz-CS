import heapq

def coin_match(coins, amount):
    path_map = {}
    min_heap = []
    heapq.heappush(min_heap, amount)
    path_map[str(amount)] = 0
    while(len(min_heap) != 0):
        top = heapq.heappop(min_heap)
        path_length = path_map[str(top)]
        if top == 0:
            return path_length
        if top < min(coins):
            continue
        for coin in coins:
            if top - coin >= 0:
                heapq.heappush(min_heap, top - coin)
                path_map[str(top - coin)] = path_length + 1
    return -1
        
        
amount = int(input()) 
n = int(input())
coins = []
for i in range(n):
    coins.append(int(input()))
print(coin_match(coins, amount))
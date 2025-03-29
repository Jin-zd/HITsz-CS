def max_value(prices):
    S = []
    S.append(0)
    for i in range(1, len(prices)):
        if prices[i] > prices[i - 1]:
            S.append(S[i - 1] + prices[i] - prices[i - 1])
        else:
            S.append(S[i - 1])
    return S[len(S) - 1]

n = int(input())
prices = []
for i in range(n):
    prices.append(int(input()))
max_profit = max_value(prices)
print(max_profit)
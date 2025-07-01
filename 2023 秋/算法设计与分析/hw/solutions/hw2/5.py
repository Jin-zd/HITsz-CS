def top_k(nums, k):
    fre_map = {}
    for i in range(len(nums)):
        if nums[i] not in fre_map.keys():
            fre_map[nums[i]] = 0
        fre_map[nums[i]] += 1
    sorted_map = sorted(fre_map.items(), key = lambda v: v[1], reverse=True)
    returnS = []
    for i in range(len(sorted_map)):
        if i >= k:
            break
        returnS.append(sorted_map[i][0])
    return returnS


n = int(input())
k = int(input())
nums = []
for i in range(n):
    nums.append(int(input()))
S = top_k(nums, k)
S.sort()
for i in range(len(S)):
    print(S[i])
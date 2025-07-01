n = int(input())
nums = [0] * n
for i in range(n):
    nums[i] = int(input())

if n == 1:
    print(nums[0])
elif n == 2:
    print(max(nums[0], nums[1]))
else:
    arr1 = nums[:n - 1]
    arr2 = nums[1:]
    m1 = [0] * (n - 1)
    m2 = [0] * (n - 1)
    m1[0] = arr1[0]
    m2[0] = arr2[0]
    m1[1] = max(arr1[0], arr1[1])
    m2[1] = max(arr2[0], arr2[1])
    for i in range(2, n - 1):
        m1[i] = max(m1[i - 2] + arr1[i], m1[i - 1])
        m2[i] = max(m2[i - 2] + arr2[i], m2[i - 1])
    print(max(m1[n - 2], m2[n - 2]))
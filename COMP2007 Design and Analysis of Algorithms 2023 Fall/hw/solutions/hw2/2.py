def binary_search(arr, target, lo, hi):
    mid = (lo + hi) // 2
    while lo <= hi:
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            return binary_search(arr, target, mid + 1, hi)
        else:
            return binary_search(arr, target, lo, mid - 1)
    return -1


arr = [-1, 0, 3, 5, 9, 12]
print(binary_search(arr, 9, 0, len(arr) - 1))
print(binary_search(arr, 2, 0, len(arr) - 1))
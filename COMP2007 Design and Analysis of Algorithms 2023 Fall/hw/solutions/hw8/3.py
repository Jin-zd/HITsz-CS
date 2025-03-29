def KMP(haystack, needle):
    m = len(needle)
    n = len(haystack)
    flag = 1
    pi = prefix_pi(needle)
    q = 0
    for i in range(n):
        while q > 0 and needle[q] != haystack[i]:
            q = pi[q - 1]
        if needle[q] == haystack[i]:
            q = q + 1
        if q == m:
            flag = 0
            q = pi[q - 1]
            return i - m + 1
    if flag:
        return -1


def prefix_pi(needle):
    m = len(needle)
    pi = [0] * m
    k = 0
    for q in range(1, m):
        while k > 0 and needle[k] != needle[q]:
            k = pi[k - 1]
        if needle[k] == needle[q]:
            k = k + 1
        pi[q] = k
    return pi

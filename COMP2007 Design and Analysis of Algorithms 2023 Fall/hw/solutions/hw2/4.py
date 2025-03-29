class NumsMedian:
    def kNum(self, nums1, nums2, k):
        length1 = len(nums1)
        length2 = len(nums2)
        index1 = 0
        index2 = 0
        while True:
            if index1 == length1:
                return nums2[index2 + k - 1]
            if index2 == length2:
                return nums1[index1 + k - 1]
            if k == 1:
                return min(nums1[index1], nums2[index2])
            newIndex1 = min(index1 + k // 2, length1) - 1
            newIndex2 = min(index2 + k // 2, length2) - 1
            if nums1[newIndex1] <= nums2[newIndex2]:
                k = k - (newIndex1 - index1 + 1)
                index1 = newIndex1 + 1
            else:
                k = k - (newIndex2 - index2 + 1)
                index2 = newIndex2 + 1

    def findMedianSortedArrays(self, nums1, nums2):
        totalLength = len(nums1) + len(nums2)
        if totalLength % 2 == 1:
            return self.kNum(nums1, nums2, totalLength // 2 + 1)
        else:
            return (self.kNum(nums1, nums2, totalLength // 2) + self.kNum(nums1, nums2, totalLength // 2 + 1)) / 2.0

    def main(self):
        m = int(input())
        n = int(input())
        nums1 = []
        nums2 = []
        for i in range(m):
            nums1.append(input())
        for i in range(n):
            nums2.append(input())
        median = self.findMedianSortedArrays(nums1, nums2)
        print(f"{median:.1f}")

if __name__ == "__main__":
    NumsMedian().main()
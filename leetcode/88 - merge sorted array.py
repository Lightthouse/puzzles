# Merge nums1 and nums2 into a single array sorted in non-decreasing order.

# Нужно не вернуть новый массив, а изменить входной
# Хакаем систему и вместо слияния массивов создаём новый, сортируем его и вливаем в первый
from typing import List
class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        sorted_list = sorted(nums1[:m] + nums2[:n])
        nums1.clear()
        nums1.extend(sorted_list)


nums_1 = [1, 2, 3, 0, 0, 0]
nums_2 = [2, 5, 6]

m = 3
n = 3

s = Solution()
res = s.merge(nums_1, m, nums_2, n)
print(nums_1)

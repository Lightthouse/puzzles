# https://leetcode.com/problems/remove-element/description/?envType=study-plan-v2&envId=top-interview-150


# Given an integer array nums and an integer val, remove all occurrences of val in nums in-place.
# The order of the elements may be changed.
# Then return the number of elements in nums which are not equal to val.

# Input: nums = [3,2,2,3], val = 3
# Output: 2, nums = [2,2,_,_]

from typing import List
class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        removed_elements = 0
        input_length = len(nums)
        while True:
            try:
                nums.remove(val)
                removed_elements += 1
            except ValueError:
                break

        return input_length - removed_elements
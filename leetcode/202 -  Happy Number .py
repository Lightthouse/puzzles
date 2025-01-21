# https://leetcode.com/problems/happy-number/description/?envType=study-plan-v2&envId=top-interview-150
class Solution(object):
    def isHappy(self, n):
        """
        :type n: int
        :rtype: bool
        """
        nums = list(str(n))

        happy = True
        while True:
            current_sum = sum(int(n) ** 2 for n in nums)
            print(current_sum)
            if current_sum in (1,7):
                break
            if len(str(current_sum)) == 1:
                happy = False
                break
            nums = list(str(current_sum))
        return happy
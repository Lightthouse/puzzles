# https://leetcode.com/problems/valid-palindrome/?envType=study-plan-v2&envId=top-interview-150

# valid palindrome

class Solution:
    def isPalindrome(self, s: str) -> bool:
        clear_string = ''.join(char.lower() for char in s if char.isalnum())
        return clear_string == clear_string[::-1]


letters = "A man, a plan, a canal: Panama"

s = Solution()
res = s.isPalindrome(letters)
print(res)

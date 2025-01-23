# https://leetcode.com/problems/reverse-words-in-a-string/description/?envType=study-plan-v2&envId=top-interview-150


# Return a string of the words in reverse order concatenated by a single space.

# Input: s = "the sky is blue"
# Output: "blue is sky the"

class Solution:
    def reverseWords(self, s: str) -> str:
        import re
        one_spaced = re.sub(r' {2,}', ' ', s)
        striped = one_spaced.strip()
        reversed_string = ' '.join(striped.split(' ')[::-1])
        return reversed_string
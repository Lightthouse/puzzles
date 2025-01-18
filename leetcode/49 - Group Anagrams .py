# https://leetcode.com/problems/group-anagrams/description/

# Given an array of strings strs, group the anagrams
# together. You can return the answer in any order.

# Input: strs = ["eat","tea","tan","ate","nat","bat"]
#
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

# все анаграммы состоят из одинаковых букв
# создадим словарь
# ключи словаря : отсортированные по буквам слова
# значения словаря : список слов до сортировки
# вернем список значений словаря
from typing import List
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        ang_dict = dict()

        for word in strs:
            sorted_word = ''.join(sorted(word))

            if ang_dict.get(sorted_word):
                ang_dict[sorted_word].append(word)
            else:
                ang_dict[sorted_word] = [word]

        return list(ang_dict.values())

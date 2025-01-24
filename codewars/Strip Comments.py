# https://www.codewars.com/kata/51c8e37cee245da6b40000bd/train/python

#  strips all text that follows any of a set of comment markers passed in.
#  Any whitespace at the end of the line should also be stripped out.

def strip_comments(string: str, markers: list[str]) -> str:
    strings_list = string.split('\n')

    changed_string = []

    for row in strings_list:

        changed_row = row[:]
        for marker in markers:
            mark_index = changed_row.find(marker)

            if mark_index != -1:
                changed_row = changed_row[:mark_index]

        changed_string.append(changed_row.rstrip())

    return '\n'.join(changed_string)



st = "apples, pears # and bananas\ngrapes\nbananas !apples"
mrk = ['#', '!']

print(strip_comments(st, mrk))
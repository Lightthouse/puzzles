# https://www.codewars.com/kata/54d81488b981293527000c8f/train/python

# Given a list of integers and a single sum value,
# return the first two values (parse from the left please) in order of appearance that add up to form the sum.

def sum_pairs(ints: list[int], s: int) -> None | list[int]:
    from collections import defaultdict
    prev_nums = defaultdict(int) # можно заменить на set, но я думал, что будут нужны индексы


    for ind, num in enumerate(ints):
        s_diff = s - num
        first_num = prev_nums.get(s_diff)


        if first_num is not None:
            return [s_diff, num]

        prev_nums[num] = ind

    return None


l1 = [1, 4, 8, 7, 3, 15]
sm1 = 8
print(sum_pairs(l1, sm1))

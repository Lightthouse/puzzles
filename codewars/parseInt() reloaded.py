# https://www.codewars.com/kata/525c7c5ab6aecef16e0001a5/train/python

def parse_int(string: str):
    values_dict: {str, int} = {
        'zero': 0,
        'one': 1,
        'two': 2,
        'three': 3,
        'four': 4,
        'five': 5,
        'six': 6,
        'seven': 7,
        'eight': 8,
        'nine': 9,

        'ten': 10,
        'eleven': 11,
        'twelve': 12,
        'thirteen': 13,
        'fourteen': 14,
        'fifteen': 15,
        'sixteen': 16,
        'seventeen': 17,
        'eighteen': 18,
        'nineteen': 19,

        'twenty': 20,
        'thirty': 30,
        'forty': 40,
        'fifty': 50,
        'sixty': 60,
        'seventy': 70,
        'eighty': 80,
        'ninety': 90,

        'hundred': 100,

        'thousand': 1000,

        'million': 1000_000

    }
    if values_dict.get(string):
        return values_dict[string]

    def extract_prefix(place, string):
        '''
        Вычленяем префиксы перед разрядами
        :param place:
        :param string:
        :return:
        '''
        index = string.find(place)
        if index == -1:
            prefix = ''
        else:
            prefix = string[:index]
            string = string[index + len(place):]

        return prefix, string

    def count_prefix(prefix: str, multiplier: str):
        '''
        Считаем сумму префикса
        :param prefix:
        :param multiplier:
        :return:
        '''
        prefix_sum = 0

        prefix = prefix.replace('and', '')
        if len(prefix) < 1:
            return prefix_sum

        # сотни
        hundred_split = prefix.split('hundred')
        if len(hundred_split[0]) != len(prefix):
            prefix_sum += sum(values_dict[num.strip()] for num in hundred_split[0].split('-')) * 100
            prefix = hundred_split[1].strip()

        # десятки + единицы
        if prefix:
            prefix_sum += sum(values_dict[num.strip()] for num in prefix.split('-'))

        return prefix_sum * values_dict[multiplier]

    # разбили на префиксы
    million_prefix, string = extract_prefix('million', string)
    thousand_prefix, string = extract_prefix('thousand', string)
    hundred_prefix, string = extract_prefix('hundred', string)
    tens = string

    # считаем значения по разрядам
    nums_place_sum = [
        count_prefix(million_prefix, 'million'),
        count_prefix(thousand_prefix, 'thousand'),
        count_prefix(hundred_prefix, 'hundred'),
        count_prefix(tens, 'one')
    ]

    return sum(nums_place_sum)


# num_str = 'seven hundred eighty-three thousand nine hundred and nineteen'
num_str = 'seven hundred thousand'

res = parse_int(num_str)

print(res)

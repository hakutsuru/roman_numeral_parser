# Roman Numerals Parsing
# Author: Sean Broderick <hakutsuru@mac.com>
# Date: 2016-09-14


import sys

user_input = sys.argv[1]

def parse_roman_numeral(one, five, ten, numeral_string):
     # given roman numeral, parse integer using given symbols

    if numeral_string == "":
        return (0, 0)
    
    # e.g. IX is two symbols meaning 9
    if numeral_string[-2:] == (one + ten):
        return (9, 2)

    # e.g. IV is two symbols meaning 4
    if numeral_string[-2:] == (one + five):
        return (4, 2)

    # handle 0, 1, 2, 3, 5, 6, 7 and 8
    symbol_count = 0
    value_count = 0
    buffer = numeral_string
    for x in range(4):
        if buffer == "":
            break
        char = buffer[-1]
        if char == one:
            symbol_count += 1
            value_count += 1
            buffer = buffer[0:-1]
        elif char == five:
            symbol_count += 1
            value_count += 5
            break
    return (value_count, symbol_count)


def roman_numeral_from_string(roman_numeral):
    # given roman numeral (using symbols up to M)
    # return integer equivalent (or none)
    buffer = roman_numeral
    int_value = 0

    # for sanity, return on edge case
    if (buffer == ""):
        return 0

    # take advantage of repetitive parsing required
    # given series of symbols, return tuple of
    # (integer, number_of_symbols)
    
    result = parse_roman_numeral("I", "V", "X", buffer)
    if result[1] > 0:
        buffer = buffer[0:-result[1]]
    int_value += result[0] * 1

    result = parse_roman_numeral("X", "L", "C", buffer)
    if result[1] > 0:
        buffer = buffer[0:-result[1]]
    int_value += result[0] * 10
    
    result = parse_roman_numeral("C", "D", "M", buffer)
    if result[1] > 0:
        buffer = buffer[0:-result[1]]
    int_value += result[0] * 100

    # functional programing told-ya-so goes here...
    # typical source of errors in mutable strings -- ensure buffer
    # pruned only when symbols matched (result[1] non-zer0),
    # and avoid requesting last char of empty buffer
    # (but such bugs were simple to fix)

    for x in range(4):
        if buffer == "":
            break
        if buffer[-1] == "M":
            buffer = buffer[0:-1]
            int_value += 1000

    # be unforgiving, if we did not consume all symbols
    # we do not have confidence in current int_value
    if (buffer != ""):
        return None
    else:
        return int_value


# convert user-supplied roman numeral
number = roman_numeral_from_string(user_input)
print(number)


# Result (sum):
# /opt/euler/python$ python3 roman_to_int.py ""
# 0
# /opt/euler/python$ python3 roman_to_int.py ZZZ
# 0
# /opt/euler/python$ python3 roman_to_int.py IX
# 9
# /opt/euler/python$ python3 roman_to_int.py IV
# 4
# /opt/euler/python$ python3 roman_to_int.py I
# 1
# /opt/euler/python$ python3 roman_to_int.py V
# 5
# /opt/euler/python$ python3 roman_to_int.py VIII
# 8
# /opt/euler/python$ python3 roman_to_int.py CMXXXVIII
# 938
# /opt/euler/python$ python3 roman_to_int.py MCDXXVIII
# 1428
# /opt/euler/python$ python3 roman_to_int.py MMDCCCLXXXVIII
# 2888

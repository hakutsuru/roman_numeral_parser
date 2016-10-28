# Roman Numerals Parsing
# Author: Sean Broderick <hakutsuru@mac.com>
# Date: 2016-10-28


user_input = ARGV[0]

def roman_numeral_from_string(roman_numeral)
  # seriously, wat? take a breath, and consider, if parsing
  # is a private implementation, herr testing acolyte dare
  # not insist that it needs unit testing (pfft, POODR)
  def parse_roman_numeral(one, five, ten, numeral_string)
    # given roman numeral, parse integer using given symbols
    # return array of [integer, number_of_symbols]
    if numeral_string == ""
      return [0, 0]
    end
    
    # e.g. IX is two symbols meaning 9
    if numeral_string[-2, 2] == (one + ten)
      return [9, 2]
    end

    # e.g. IV is two symbols meaning 4
    if numeral_string[-2, 2] == (one + five)
      return [4, 2]
    end

    # handle 0, 1, 2, 3, 5, 6, 7 and 8
    symbol_count = 0
    value_count = 0
    buffer = numeral_string
    for x in 0..4
      if buffer == ""
        break
      end
      char = buffer[-1]
      if char == one
        symbol_count += 1
        value_count += 1
        buffer = buffer[0..-2]
      elsif char == five
        symbol_count += 1
        value_count += 5
        break
      end
    end
    [value_count, symbol_count]
  end

  # given roman numeral (using symbols up to M)
  # return integer equivalent (or none)
  buffer = roman_numeral
  int_value = 0

  # for sanity, return on edge case
  if (buffer == "")
    return 0
  end

  # take advantage of repetitive parsing
  rosetta = { 1   => ["I", "V", "X"],
           10  => ["X", "L", "C"],
           100 => ["C", "D", "M"] }
  for key in [1, 10, 100]
    result = parse_roman_numeral(*rosetta[key], buffer)
    if result[1] > 0
      stop = result[1] + 1
      buffer = buffer[0..-stop]
    end
    int_value += result[0] * key
  end

  # allow MMMMM to be 5000
  # appears to be more than one historical
  # representation for numbers > 4000,
  # so just make this simpler for us
  for x in 0..4
    if buffer == ""
      break
    end
    if buffer[-1] == "M"
      buffer = buffer[0..-2]
      int_value += 1000
    end
  end

  # be unforgiving, if we did not consume all symbols
  # we do not have confidence in current int_value
  if (buffer != "")
    return nil
  else
    return int_value
  end
end

# convert user-supplied roman numeral
number = roman_numeral_from_string(user_input)
if number.nil?
  puts "nil"
else
  puts number
end


# Result (sum):
# /opt/euler/ruby$ ruby roman_to_int.rb ""
# 0
# /opt/euler/ruby$ ruby roman_to_int.rb ZZZ
# nil
# /opt/euler/ruby$ ruby roman_to_int.rb IX
# 9
# /opt/euler/ruby$ ruby roman_to_int.rb IV
# 4
# /opt/euler/ruby$ ruby roman_to_int.rb I
# 1
# /opt/euler/ruby$ ruby roman_to_int.rb V
# 5
# /opt/euler/ruby$ ruby roman_to_int.rb VIII
# 8
# /opt/euler/ruby$ ruby roman_to_int.rb CMXXXVIII
# 938
# /opt/euler/ruby$ ruby roman_to_int.rb MCDXXVIII
# 1428
# /opt/euler/ruby$ ruby roman_to_int.rb MMDCCCLXXXVIII
# 2888

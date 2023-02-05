INTEGER = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'a' => 10,
  'b' => 11,
  'c' => 12,
  'd' => 13,
  'e' => 14,
  'f' => 15
}

def string_to_base(str, radix = 10)
  str.downcase.chars.inject(0){ |acc, char| acc * radix + INTEGER[char] }
end

def string_to_integer(str)
  str.chars.inject(0){ |accumulator, char| accumulator * 10 + INTEGER[char] }
end

def hex_to_decimal(str)
  str.downcase.chars.inject(0){ |accumulator, char| accumulator * 16 + INTEGER[char] }
end

puts string_to_base('12495')
puts string_to_base('4D9f', 16)
puts string_to_base('1376', 8)
puts string_to_base('11111111', 2)
puts string_to_base('1011111010111101', 2)

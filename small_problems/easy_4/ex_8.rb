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

def string_to_signed_base(str, radix = 10)
  sign = str[0] == '-' ? -1 : 1
  str.slice!(0) if ['-','+'].include?str[0]
  string_to_base(str, radix) * sign
end

puts string_to_signed_base('-12495') == -12495
puts string_to_signed_base('4D9f', 16) == 19871
puts string_to_signed_base('+1376', 8) == 766
puts string_to_signed_base('-11111111', 2) == -255
puts string_to_signed_base('1011111010111101', 2) == 48829

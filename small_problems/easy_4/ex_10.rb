STRING = %w(0 1 2 3 4 5 6 7 8 9).freeze

def integer_to_string(int)
  str = case int <=> 0
    when -1 then '-'
    when +1 then '+'
    else ''
  end

  digits = int.abs.digits

  str.concat STRING[digits.pop] until digits.size.zero?
  str
end

puts integer_to_string(4321) == '+4321'
puts integer_to_string(0) == '0'
puts integer_to_string(-5000) == '-5000'

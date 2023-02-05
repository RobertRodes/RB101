def sum(number)
  number.to_s.chars.inject { |acc, elem| acc.to_i + elem.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

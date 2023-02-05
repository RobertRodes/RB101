def stringy(count)
  result = ''
  count.times { |idx| result << ((idx + 1) % 2).to_s }
  result
end

def stringy2(count)
  result = ''
  count.times { |idx| result << idx.even? ? '1' : '0' }
  result
end

puts stringy2(6)
puts stringy2(9)
puts stringy2(4)
puts stringy2(7)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

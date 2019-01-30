def multiply(n1, n2)
  n1 * n2
end

def pow(num, exp)
  result = 1
  exp.abs.times { result = multiply(result, num) }
  result = exp < 0 ? 1 / result.to_r : result
end

print 'Number? '
num = gets.chomp.to_i
print 'Exponent? '
exp = gets.chomp.to_i
puts "The number #{num} to the power of #{exp} is #{pow(num, exp)}."
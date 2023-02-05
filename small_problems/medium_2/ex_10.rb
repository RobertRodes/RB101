def sum_square_difference(num)
  square_sum = (1..num).sum ** 2
  sum_square = (1..num).sum { |x| x ** 2 }
  square_sum - sum_square
end

def sum_square_difference(num)
  square_sum = ((num + 1) * num / 2.0) ** 2
  sum_square = 0
  1.upto(num) { |i| sum_square += i ** 2 }
  square_sum - sum_square
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
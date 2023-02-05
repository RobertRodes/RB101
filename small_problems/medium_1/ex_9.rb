def fibonacci(num)
  return num if num < 2
  f1 = 0
  f2 = 1
  f3 = 1
  (num - 2).times do |i|
    f1 = f2
    f2 = f3
    f3 = f2 + f1
  end
  f3
end

p fibonacci(100000)
exit

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
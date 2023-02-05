def fibonacci_first_60
first_60 = [0, 1, 1]
  f1 = 0
  f2 = 1
  f3 = 1
  57.times do |i|
    f1 = f2
    f2 = f3
    f3 = (f2 + f1) % 10
    first_60.push(f3)
  end
  first_60
end

def fibonacci_last(num)
  fibonacci_first_60[(num % 60)]
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(123456789987745)
p fibonacci_last(2093480295038402938019340293840293428573498572034)
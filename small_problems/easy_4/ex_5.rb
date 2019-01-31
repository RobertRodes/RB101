def multisum (number)
  (1..number).select { |n| (n % 5).zero? || (n % 3).zero? }.sum
end

def multisum2 (number)
  (1..number).inject(0) { |sum, n| (n % 5).zero? || (n % 3).zero? ? sum + n : sum }
end


puts multisum(25) == 168
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

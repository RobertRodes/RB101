def average(arr)
  arr.inject(:+) / arr.size.to_f
end

puts average([1, 5, 87, 45, 8, 8]).to_int == 25
puts average([9, 47, 23, 95, 16, 52]).to_int == 40
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

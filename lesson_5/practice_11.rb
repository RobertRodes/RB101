# Select values that are multiples of 3; keep original array structure.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select { |value| (value % 3).zero? }
end

p arr
p new_arr

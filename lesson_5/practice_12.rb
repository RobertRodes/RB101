# Select values that are multiples of 3; keep original array structure.


arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_arr = {}
arr.each do |value|
  new_arr.store(value[0], value[1])
end

# Should match
p arr.to_h
p new_arr
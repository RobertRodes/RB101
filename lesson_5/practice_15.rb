# Return an array containing only hashes with even numbers (b, d, e, f).

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr_new = arr.map do |hashes|
  result = hashes.select do |key, value|
    hashes[key].all? {|i| i.even?} == true
  end
  result
end

p arr_new

# Ok, didn't get the requirement down pat. I've returned the hash elements whose arrays have all even numbers.

arr_new2 = arr.select do |hashes|
  hashes.all? {|k, v| v.all?(&:even?) }
end

p arr_new2

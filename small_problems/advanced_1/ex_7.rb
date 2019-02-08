def merge(arr1, arr2)
  a1 = arr1.clone
  a2 = arr2.clone
  merged_array = []
  until a1.empty? && a2.empty?
    c_val = (a1 + a2).min
    merged_array.push(c_val)
    a1.include?(c_val) ? a1.shift : a2.shift
  end
  merged_array
end

a = [1, 5, 9]
p a[0].object_id

b = [2, 6, 8]

p merge(a, b)

p a[0].object_id
p a
p b
exit

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

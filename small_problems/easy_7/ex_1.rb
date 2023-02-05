def interleave(arr1, arr2)
  new_arr = []
  arr1.each do |value|
    new_arr << value
    new_arr << arr2[arr1.index(value)]
  end
  new_arr
end


p interleave([1,2,3], %w(a b c))
    
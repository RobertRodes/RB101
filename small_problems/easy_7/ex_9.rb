def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |value1|
    arr2.each do |value2|
      result << value1 * value2
    end
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])
def sum_of_sums(arr)
  result = 0
  until arr.size.zero?
    result += arr.reduce(:+)
    arr.pop
  end
  result
end

def sum_of_sums(nums)
  sum = 0
  nums.map { |num| sum += num }.reduce(:+)
end

def sum_of_sums2(arr)
  result = 0
  arr2 = arr.clone
  until arr2.size.zero?
    result += arr2.reduce(:+)
    arr2.pop
  end
  result
end

a = [3,5,2,7,4,6,1]
p sum_of_sums(a)
p a
a = [3,5,2,7,4,6,1]
p sum_of_sums2(a)
p a
exit
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
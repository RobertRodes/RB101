def oddities(arr)
  arr.reject { |value| arr.rindex(value).odd? }
end

def oddities2(arr)
  arr.select { |value| arr.rindex(value).even? }
end

def oddities3(arr)
  arr.delete_if { |value| arr.rindex(value).odd? }
end

def oddities4(arr)
  index = 0
  arr2 = []
  while index < arr.size
    arr2.push arr[index]
    index += 2
  end
  arr2
end

def oddities5(arr)
  arr2 = []
  (0..arr.size - 1).step(2).each { |i| arr2.push arr[i] }
  arr2
end

def oddities6(arr)
  (0..arr.size - 1).step(2).map { |i| arr[i] }
end

def evennesses(arr)
  (1..arr.size - 1).step(2).map{ |i| arr[i] }
end



p evennesses(%w(a a c d e f g h))
p oddities(%w(a a c d e f g h))
p oddities2(%w(a a c d e f g h))

exit
p oddities([2, 2, 3, 4, 5, 6])
p oddities2([2, 2, 3, 4, 5, 6])
p oddities3([2, 2, 3, 4, 5, 6])
p oddities4([2, 2, 3, 4, 5, 6])
p oddities5([2, 2, 3, 4, 5, 6])
p oddities6([2, 2, 3, 4, 5, 6])
p oddities6(%w(a a c d e f g h))

puts oddities5([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities5([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities5(['abc', 'def']) == ['abc']
puts oddities5([123]) == [123]
puts oddities5([]) == []
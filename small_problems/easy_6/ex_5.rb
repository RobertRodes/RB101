def reverse0(arr)
  new_arr = []
  counter = arr.size
  until counter.zero?
    counter -= 1
    new_arr << arr[counter]
  end
  new_arr
end

def reverse1(arr)
  arr.each_with_object([]) { |e, new_arr| new_arr.unshift e }
end

def reverse2(arr)
  new_arr = arr.inject([]) { |new_arr, e| new_arr.unshift e  }
end

def reverse(arr)
  arr.reverse_each.reduce([], :<<)
end

p reverse([1,2,3,4,5])

list = [1,2,3,4]
result = reverse(list)
p result
p result == [4, 3, 2, 1]
p list == [1, 2, 3, 4]
p list.object_id != result.object_id

list = %w(a b e d c)
p reverse(list) == ["c", "d", "e", "b", "a"]
p list == %w(a b e d c)

list = ['abc']
p reverse(list) == ["abc"]
p list == ["abc"]

list = []
p reverse(list) == []
p list == []
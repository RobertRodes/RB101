def merge_sort(arr)
  a1 = arr[0..arr.size/2-1]
  a2 = arr[arr.size/2..-1]
  
  a1 = merge_sort(a1) if a1.size > 1
  a2 = merge_sort(a2) if a2.size > 1
  
  merge(a1, a2)
end

def merge(a1, a2)
  a3 = []

  until a1.empty? || a2.empty?
    if a1[0] > a2[0]
      a3.push a2.shift
    else
      a3.push a1.shift
    end
  end

  until a1.empty?
    a3.push a1.shift
  end
  
  until a2.empty?
    a3.push a2.shift
  end
  
  a3
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]


p merge_sort([33, 4, 39, 32, 45, 12, 14, 3, 19, 29, 6, 7, 54, 27, 36, 11, 8])
def halvsies2(arr)
  [arr[0..arr.size / 2 - (arr.size.even? ? 1 : 0)],
   arr[arr.size / 2 + (arr.size.odd? ? 1 : 0)..arr.size - 1]]
end

def halvsies(arr)
  [arr[0..(arr.size / 2.0).ceil - 1],arr[(arr.size / 2.0).ceil..arr.size - 1]]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]

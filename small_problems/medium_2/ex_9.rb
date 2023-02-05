def bubble_sort3(arr)
  changed = true
  while changed
    changed = false
    0.upto(arr.size - 2) do |i|
      next unless arr[i] > arr[i + 1]
      arr[i], arr[i + 1] = arr[i + 1], arr[i]
      changed = true
    end
  end
  arr
end

def bubble_sort(arr)
  changed = true
  stop_at = arr.size - 2
  while changed
    changed = false
    0.upto(stop_at) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        changed = true
      end
    end
    stop_at -= 1
  end
  arr
end

def bubble_sort(arr)
  stop_at = arr.size - 2
  while stop_at > 1
    new_stop_at = 0
    0.upto(stop_at) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        new_stop_at = i
      end
    end
    stop_at = new_stop_at
  end
  arr
end

  
p bubble_sort([1,4,5,2,7,5,6,3])
p bubble_sort(%w(Peter Piper picked a peck of pickled peppers))
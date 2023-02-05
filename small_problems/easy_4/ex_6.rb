def running_total2(arr)
  running_totals = []
  current_total = 0
  arr.each do |value|
    current_total += value
    running_totals.push current_total 
  end
  running_totals
end

def running_total3(arr)
  current_total = 0
  arr.each_with_object([]) do |value, running_totals|
    current_total += value
    running_totals.push current_total 
  end
end

def running_total(arr)
  current_total = 0
  arr.map { |value| current_total += value }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []


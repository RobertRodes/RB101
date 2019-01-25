# Sort the sub-arrays in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |sub_arr|
  sub_arr.sort.reverse
end

p new_arr

new_arr = arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

p new_arr

require 'benchmark'

arr = []
50_000.times { |i| arr.push i }

n = 500
Benchmark.bm do |x|
  x.report do
    n.times do
      arr2 = arr.sort.reverse
    end
  end

  x.report do
    n.times do
      arr2 = arr.sort { |a, b| b <=> a }
    end
  end
end
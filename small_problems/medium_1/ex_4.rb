def lights(n)
  arr = []
  arr.fill(true, 0, n)
  1.upto(n - 1) do |i|
    (i..n-1).step(i + 1) { |i2| arr[i2] = !arr[i2] }
  end
  arr.map.with_index { |v, i| i + 1 if v }.compact
end

p lights(5)
p lights(10)
p lights(1000)
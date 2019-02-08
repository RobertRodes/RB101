def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

10.step(1, -1) { |i| puts i }
puts 'LAUNCH!'
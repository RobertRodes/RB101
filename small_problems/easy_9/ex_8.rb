def sequence(count, interval)
  result = []
  return result if count.zero?
  if interval.zero?
    count.times { result.push(0) }
  else
    interval.step(count * interval, interval) { |number| result.push(number) }
  end
  result
end

p sequence(5, -3)
p sequence(3, 7)
p sequence(3, 1)
p sequence(6, 0)
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
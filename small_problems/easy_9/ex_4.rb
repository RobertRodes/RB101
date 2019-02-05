def sequence(num)
  return [] if num.zero?
  num < 0 ? -1.downto(num).to_a : 1.upto(num).to_a
end

p sequence(1)
p sequence(7)
p sequence(-11)
p sequence(0)
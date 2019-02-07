def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  return :invalid if sides.sum <= sides.max * 2
  return :equilateral if sides.uniq.size == 1
  return :isosceles if sides.uniq.size == 2
  :scalene
end

p triangle(0,0,0)

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
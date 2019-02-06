def print_line(count, size, outline)
  line = if outline
    1 == count ? '*' : "*#{' ' * (count - 2)}*"
  else
    '*' * count
  end
  puts line.center(size)
end

def diamond(num, outline = false)
  1.step(num - 2, 2) { |i| print_line(i, num, outline) }
  num.step(1, -2) { |i| print_line(i, num, outline) }
end

diamond(1)
diamond(3)
diamond(5, true)
diamond(7)
diamond(9, true)
diamond(11)
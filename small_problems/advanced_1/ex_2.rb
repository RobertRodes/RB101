def spaces(num)
  ' ' * num
end

def star(num)
  inside = num / 2 - 1
  outside = 0
  until inside.zero?
    puts "#{spaces(outside)}*#{spaces(inside)}*#{spaces(inside)}*#{spaces(outside)}"
    inside -= 1
    outside += 1
  end
  puts '***'.center(num)
  puts '*' * num
  puts '***'.center(num)
  inside = 1
  outside -= 1
  while outside >= 0
    puts "#{spaces(outside)}*#{spaces(inside)}*#{spaces(inside)}*#{spaces(outside)}"
    inside += 1
    outside -= 1
  end
end

star(7)
star(79)
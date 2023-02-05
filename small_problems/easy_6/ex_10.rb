CHAR = '*'

def triangle(size)
  (1..size).step do |i|
    puts (CHAR * i).rjust(size)
  end
end

def triangle2(size, x = 0, y = 0)
  (1..size).step do |i|
    line = CHAR * (1 == y ? size - i + 1 : i )
    puts 1 == x ? line.rjust(size) : line
  end  
end  

triangle2(10)
triangle2(10, 1)
triangle2(10, 0, 1)
triangle2(10, 1, 1)
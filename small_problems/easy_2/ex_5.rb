loop do
  print "What's your name? "
  name = gets.chomp
  break if name.empty?
  
  puts "#{name.chars.last == '!' ? 'HELLO ' + name.chop.upcase +
    '. WHY ARE WE SCREAMING?' : 'Hello ' + name + '.'}"
end

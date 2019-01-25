SQ_FT_IN_SQ_M = 10.7639

loop do
  print 'Enter the length of the room in meters: '
  length = gets.chomp.to_f
  break if length == 0
  
  print 'Enter the width of the room in meters: '
  width = gets.chomp
  break if width.empty?
  
  area = length.to_f * width.to_f.round(2)
  puts "The area of the room is #{ area } square meters, or #{ (area * SQ_FT_IN_SQ_M).round(2) } square feet."
end

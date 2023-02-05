number_list = []
ordinals = {0 => '1st', 1 => '2nd', 2 => '3rd', 3 => '4th', 4 => '5th' }

5.times do |i|
  puts "Enter the #{ordinals[i]} number:"
  number_list << gets.chomp.to_i
end

puts 'Enter the last number: '
last_number = gets.chomp.to_i

puts "The number #{last_number} " \
     "#{number_list.include?(last_number) ? 'appears' : 'does not appear'} " \
     "in #{number_list}." 
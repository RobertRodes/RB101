puts
puts 'First, we create the two arrays, array1 and array2:'
puts
puts "array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)"
puts "array2 = []"
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
puts
puts 'They both have different object ids:'
puts
puts "array1 = #{array1.object_id}"
puts "array2 = #{array2.object_id}"
puts
puts 'Now, we do the each: '
puts
puts 'array1.each { |value| array2 << value }'
array1.each { |value| array2 << value }
puts
puts "Since we used << instead of equals, the elements' object ids are the same,"
puts "while the arrays' ids are still the same as when they were created:"
puts
puts "array1 = #{array1.object_id}"
puts "array2 = #{array2.object_id}"
puts 
puts "(We'll just test one array element...)"
puts
puts "array1[3] = #{array1[3].object_id}"
puts "array2[3] = #{array2[3].object_id}"
puts
puts 'Now, suppose we do this:'
puts
puts "array2[3] = 'Shemp'"
array2[3] = 'Shemp'
puts
puts "Now, array2[3] = #{array2[3].object_id}"
puts "And array1[3] still = #{array1[3].object_id}."
puts
puts "And after this:"
puts
puts "array1.each { |value| value.upcase! if value.start_with?('C', 'S') }"
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts
puts 'Look what happens:'
puts
puts array2
def change_array(the_array)
  puts 'the_array inside = ' + the_array.object_id.to_s
  puts 'the_array[0] inside, object id = ' + the_array[0].object_id.to_s

  the_array[0] += 1

  print "the_array modified, inside, values = #{the_array}\n"
  puts 'the_array after modification, inside, object id = ' + the_array.object_id.to_s
  puts 'the_array[0] after modification, inside, object id = ' + the_array[0].object_id.to_s
end

def change_array2(the_array)
  puts 'the_array, object id = ' + the_array.object_id.to_s + "\n"

  the_array = [2,2,3,4]

  print "the_array, after change = #{the_array}\n"
  puts 'the_array, object id, after change = ' + the_array.object_id.to_s + "\n"
end

puts
puts "Calls to change_array: "
puts

an_array = [1,2,3,4]

puts 'an_array outside, object id = ' + an_array.object_id.to_s
puts 'an_array[0] outside, object id = ' + an_array[0].object_id.to_s

change_array an_array

print "an_array outside, after method call, values = #{an_array}\n"
puts 'an_array outside, after method call, object id = ' + an_array.object_id.to_s
puts 'an_array[0] outside, after method call, object id = ' + an_array[0].object_id.to_s

puts
puts "Calls to change_array2:"
puts

an_array = [1,2,3,4]

change_array2 an_array

print "an_array outside, after call to change_array2 = #{an_array}\n"

def change_hash(the_hash)
  puts 'the_hash inside, object id = ' + the_hash.object_id.to_s
  puts 'the_hash[:key1] inside, object id = ' + the_hash[:key1].object_id.to_s

  the_hash[:key1] += 1

  print "the_hash modified, inside, values = #{the_hash}\n"
  puts 'the_hash after modification, inside, object id = ' + the_hash.object_id.to_s
  puts 'the_hash[:key1] after modification, inside, object id = ' + the_hash[:key1].object_id.to_s
end
puts
puts "Calls to change_hash: "
puts

a_hash = {key1: 1, key2: 2}

puts 'a_hash outside, object id = ' + a_hash.object_id.to_s
puts 'a_hash[:key1] outside, object id = ' + a_hash[:key1].object_id.to_s

change_hash a_hash

print "a_hash outside, after method call, values = #{a_hash}\n"
puts 'a_hash outside, after method call, object id = ' + a_hash.object_id.to_s
puts 'a_hash[:key1] outside, after method call, object id = ' + a_hash[:key1].object_id.to_s


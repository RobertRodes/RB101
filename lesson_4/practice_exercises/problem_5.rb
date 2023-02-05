flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |i| i.start_with? 'Be' }

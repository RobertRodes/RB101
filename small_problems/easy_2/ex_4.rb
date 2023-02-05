#require 'date'

print 'What is your age? '
age = gets.chomp

print 'At what age would you like to retire? '
retire_age = gets.chomp

work_years = retire_age.to_i - age.to_i
#this_year = Date.today.year
this_year = Time.now.year

puts "It's #{this_year}. You will retire in #{this_year + work_years}."
puts "Only #{work_years} more years to go!"

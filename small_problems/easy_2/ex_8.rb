# Sum or product of consecutive numbers

def prompt(what_to_say, newline = false)
  print '>> ' + what_to_say + ' '
  print "\n" if newline
end

the_integer = ''
loop do
  prompt 'Please enter an integer greater than 0:'
  input = gets.chomp
  the_integer = input.to_i
  break if the_integer == input.to_i && the_integer > 0
  prompt 'Sorry, please try again.', true
end

operation = ''
loop do
  prompt 'Would you like a sum (s) or product (p)?'
  operation = gets.chomp.downcase
  break if %w(p s).include? operation 
  prompt 'Sorry, please try again.', true
end

counter = 2
result = 1
while counter <= the_integer
  operation == 's' ? result += counter : result *= counter
  counter += 1
end

result2 = operation == 's' ? (1..the_integer).inject(:+) : (1..the_integer).inject(:*)

puts "Your #{ operation == 's' ? 'sum' : 'product' } is #{ result }."
puts "Your #{ operation == 's' ? 'sum' : 'product' } is #{ result2 }."


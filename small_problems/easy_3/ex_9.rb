def palindrome?(sample)
  input = sample.scan(/\w/).join.downcase
  input.reverse == input
end

print 'Enter a string: '
sample = gets.chomp
puts "\"#{sample}\" is #{palindrome?(sample) ? '' : ' not '}a palindrome."
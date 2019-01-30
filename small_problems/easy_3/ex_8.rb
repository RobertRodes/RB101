def palindrome?(sample)
  sample.reverse == sample
end


print 'Enter a string: '
sample = gets.chomp
puts "\"#{sample}\" is #{palindrome?(sample) ? '' : ' not '}a palindrome."
def prompt(string)
  puts '==> ' + string
end

prompt 'Please enter a word or multiple words:'
input = gets.chomp
puts "\"#{input}\" has #{input.split.join.size} characters."
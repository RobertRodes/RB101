def greetings(name, occupation)
  puts "=>Hello, #{name.join(' ')}! Nice to have a #{occupation[:title]} " /
       "#{occupation[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
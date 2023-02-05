def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

x = 'hello world'
p spin_me(x) # "olleh dlrow"
p x
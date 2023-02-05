def repeater(str)
  str.chars.each_with_object('') { |char, strout| strout << char << char }
end

p repeater('Hello. How are you doing?')

def repeater(str)
  str.chars.each_with_object('') do |char, strout|
    strout << char << char =~ /[b-z&&[^eiou]]/i ? char : ''
  end
end

p repeater('Hello. How are you doing?')

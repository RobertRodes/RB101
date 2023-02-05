def cleanup(str)
  str.gsub!(/[^A-Za-z ]/, ' ')
  until str.gsub!('  ', ' ').nil?
  end
  str
end

def cleanup2(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

def cleanup3(str)
  str = str.chars.each do |char|
    char.replace(' ') unless (65..90).include?(char.ord) || (97..122).include?(char.ord)
  end.join.squeeze!(' ')
  str
end

x = "---what's my +*& line?"
p cleanup(x)
p x

x = "---what's my +*& line?"
p cleanup2(x)
p x
#p cleanup("---what's my +*& line?") == ' what s my line '
#p cleanup('(*(*&   a   *^*& lkajlkaj o[i   aoij  ajq==98apa-09890809\\]]\]\]\  a')  
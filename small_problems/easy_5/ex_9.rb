def crunch2(str)
  str.gsub(/(.)(?=\1)/, '')
end

def crunch(str)
  counter = 0
  prevchar = ''
  ret_string = ''
  while counter < str.length
    ret_string << str[counter] unless str[counter] == prevchar
    prevchar = str[counter]
    counter += 1
  end
  ret_string
end

def crunch(text)
  index = 0
  crunch_text = ''
  p text.length - 1
  while index < text.length - 1
    p index
    p text[index]
    gets
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  p crunch_text
  gets
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
def center_of(str)
  new_str = ''
  center_index = str.length / 2
  if str.length.even?
      new_str << str[center_index - 1..center_index] 
  else
    new_str << str[str.length / 2]
  end
  new_str
end

p center_of('I love ruby') #== 'e'
p center_of('Launch School') #== ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') #== 'hs'
p center_of('x') #== 'x'
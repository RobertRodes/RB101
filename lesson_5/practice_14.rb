# Uppercase size, capitalize colors. (Assuming "return an array" means return a new array.)

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}


new_hsh = {}
hsh.each do |key, value|
  new_hsh[key] = {type: value[:type], colors: value[:colors].map(&:capitalize), size: value[:size].upcase}
end

# Only new_hsh should be modified.

p hsh
p new_hsh

# Annddd...I should have reread the requirements. Working past quitting time, always a bad idea.
# So, nice hash, with all the colors capped and all the sizes upcased. Now, let's do the problem instead.
# Pull colors of fruits and sizes of vegetables into an array. Preserve colors as sub-array. Capitalize
# colors, upcase sizes.

new_ary = []
hsh.each do |key, value|
  if value[:type] == 'vegetable'
    new_ary.push(value[:size].upcase) 
  else
    new_ary.push(value[:colors].map(&:capitalize))
  end
end
  
p new_ary

# Mixed up with the idea that I couldn't pull a subset of records without using select. Tried using map and
# select together, couldn't get the right mix, used each instead. So, if you're using each to iterate through
# an array or hash, and plugging the results into a new array as you go, then it's probably a place where
# you can use a map more concisely.

new_ary = hsh.map do |key, value|
  if value[:type] == 'vegetable'
    value[:size].upcase
  else
    value[:colors].map(&:capitalize)
  end
end

p new_ary

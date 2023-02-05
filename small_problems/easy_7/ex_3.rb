def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

def word_cap2(str)
  str.split.map{ |word| word.downcase.sub(word[0], word[0].upcase) }.join(' ')
end

def word_cap3(str)
  str.split.each_with_object([]) do |word, new_str|
    word = word.downcase.sub(word[0], word[0].upcase)
    new_str << word
  end.join(' ')
end
  
puts word_cap3('fourscore and "seven" yeArs ago')
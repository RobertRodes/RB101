def swap2(str)
  str.split.map do |w|
    if w.size == 1 then w
    else w.chars.last + w.slice(1, w.size - 2) + w.chars.first
    end
  end.join(' ')
end

def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap2(words)
  result = words.split.map do |word|
    temp = swap_first_last_characters(word[0], word[-1])
    word[0], word[-1] = temp[0], temp[-1]
    word
  end
  result.join(' ')
end

def swap(words)
  result = words.split.each { |w| w[0], w[-1] = w[-1], w[0] }.join(' ')
end

puts swap('Shall I compare thee to a summers day?')
puts swap('a')
puts swap('hello')

def word_sizes2(str)
  str.split.each_with_object({}) do |word, word_counts|
    word_counts[word.size].nil? ? word_counts[word.size] = 1 : word_counts[word.size] += 1
  end
end

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, word_counts|
    word_counts[word.size] += 1
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
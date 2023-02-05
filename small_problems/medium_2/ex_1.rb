COLUMN_WIDTH = 80

def sentences(file_name)
  lines = []
  File.foreach(file_name) {|line| lines.push(line) }
  sentences = []
  sentence = ''
  lines.each do |line|
    if line.match?(/[.?!]/)
      line_parts = line.split(/(?<=[?.!])/)
      while line_parts.size > 1
        sentence << line_parts.shift
        sentences.push(sentence.strip)
        sentence = ''
      end
      sentence << line_parts[0].sub(/\n/, '') << ' '
    else
      sentence << line.sub(/\n/, '') << ' '
    end
  end
  sentences.push(sentence.strip)
end

def format_sentence(word_array)
  char_count = 0
  word_array.each do |word|
    char_count += word.size + 1
    if char_count > COLUMN_WIDTH
      word.prepend("\n")
      char_count = word.size + 1
    end
  end
  word_array
end

longest_sentence = sentences('Lincoln.txt').map { |sentence| sentence.split }.max_by(&:size)
puts
puts "The longest sentence has #{longest_sentence.size} words:"
puts
puts format_sentence(longest_sentence).join(' ')
puts

text = File.read('Lincoln.txt')
sentences = text.split(/(?<=[?.!])/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
number_of_words = largest_sentence.split.size
largest_sentence = format_sentence(largest_sentence.split).join(' ').strip
puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
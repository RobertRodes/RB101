def select_letters(the_string, the_letter)
  counter = 0
  result = ''
  loop do
    result << the_letter if the_string[counter].casecmp? == the_letter
    counter += 1
    break if counter == the_string.size
  end
  result
end

def count_letters(the_string)
  counter = 0
  result = {}
  until counter == the_string.size
    current_char = the_string[counter].downcase

    counter += 1
    next unless ALPHABET.include? current_char

    if result.include?(current_char.to_sym)
      result[current_char.to_sym] += 1
    else
      result[current_char.to_sym] = 1
    end
  end
  result.sort.to_h
end

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.freeze
a_string = 'Now is the time for all good men to come to the aid of their country.'
puts select_letters a_string, 'e'
puts count_letters a_string

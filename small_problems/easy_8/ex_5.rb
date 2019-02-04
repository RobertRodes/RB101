def substrings_at_start(str, startpos)
  counter = startpos
  arr = []
  until counter == str.size
    arr.push str[startpos..counter]
    counter += 1
  end
  arr
end

def substrings(str)
  arr = []
  0.upto(str.size - 1) do |i|
    arr.concat(substrings_at_start(str, i))
  end
  arr
end

def palindromes(str)
  substrings(str).map do |v|
    v if v.gsub(/[^a-z0-9]/i, '').length > 1 &&
         v.downcase.gsub(/[^a-z0-9]/i, '') ==
         v.downcase.gsub(/[^a-z0-9]/i, '').reverse
  end.compact
end

p palindromes("Madam-I'm-Adam")

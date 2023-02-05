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

p substrings('abcde')
def substrings_at_start(str)
  counter = 0
  arr = []
  until counter == str.size
    arr.push str[0..counter]
    counter += 1
  end
  arr
end

p substrings_at_start('xyzzyab')
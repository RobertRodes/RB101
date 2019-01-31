def short_long_short(str1, str2)
  str_array = [str1, str2]
  str_array.min_by(&:length) + str_array.max_by(&:length) + str_array.min_by(&:length)
end

def short_long_short2(str1, str2)
  if str1.length < str2.length
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

p short_long_short('abc', 'defgh')
p short_long_short2('abc', 'defgh')

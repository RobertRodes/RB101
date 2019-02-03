def swapcase(str)
  str.chars.map { |char| char.match?(/[a-z]/) ? char.upcase : char.downcase }.join
end

def swapcase(str)
  str.chars.map { |char| char =~ /[a-z]/ ? char.upcase : char.downcase }.join
end  
  
puts swapcase('Fourscore and "seven" yeArs AGO')
START_UPPER = true
START_LOWER = false

def staggered_case(str, up_on = START_UPPER)
  str.chars.map do |char|
    char = up_on ? char.upcase : char.downcase
    up_on = !up_on
    char
  end.join
end
  
puts staggered_case("Fourscore and seven (that's 87) yeArs AGO", START_LOWER)
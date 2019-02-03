START_UPPER = true
START_LOWER = false

def staggered_case(str, up_on = START_UPPER, ignore_non_alphas = false)
  str.chars.map do |char|
    char = up_on ? char.upcase : char.downcase
    up_on = char =~ /[a-z]/i || !ignore_non_alphas ? !up_on : up_on
    char
  end.join
end

puts staggered_case("Fourscore and seven (that's eighty-seven) years ago")
puts staggered_case("Fourscore and seven (that's eighty-seven) years ago", START_LOWER)
puts staggered_case("Fourscore and seven (that's eighty-seven) years ago", START_UPPER, true)
puts staggered_case("Fourscore and seven (that's eighty-seven) years ago", START_LOWER, true)
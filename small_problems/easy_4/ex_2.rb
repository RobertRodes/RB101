# stolen from here: https://github.com/rails/rails/blob/3f96b6973b82ad17e443dd1d21be05996fb6fbf0/activesupport/lib/active_support/inflector/methods.rb#L345

def ordinal(number)
  abs_number = number.to_i.abs

  if (11..13).include?(abs_number % 100)
    "th"
  else
    case abs_number % 10
      when 1; "st"
      when 2; "nd"
      when 3; "rd"
      else    "th"
    end
  end
end

def ordinalize(number)
  "#{number}#{ordinal(number)}"
end

# End of stolen code

def century(year)
  return 'There is no year zero.' if year.zero?
  century = year.abs.to_int / 100 + 1
  century -= 1 if (year % 100).zero?
  ordinalize(century.to_s) + (year < 0 ? ' BCE' : '')
end

puts century(0)
puts century(1)
puts century(-1)
puts century(2000)
puts century(100)
puts century(-100)
puts century(101.25)
puts century(-101)

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
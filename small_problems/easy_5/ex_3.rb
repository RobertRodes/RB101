def after_midnight(str)
  hours = str.slice(0, 2).to_i * 60
  mins = str.slice(-2, 2).to_i
  (hours + mins) % 1440
end

def before_midnight(str)
  (1440 - after_midnight(str)) % 1440
end

puts after_midnight('00:00') #== 0
puts before_midnight('00:00') #== 0
puts after_midnight('12:34') #== 754
puts before_midnight('12:34') #== 686
puts after_midnight('24:00') #== 0
puts before_midnight('24:00') #== 0
DOW = {
  0 => 'Sunday',
  1 => 'Monday',
  2 => 'Tuesday',
  3 => 'Wednesday',
  4 => 'Thursday',
  5 => 'Friday',
  6 => 'Saturday'
}

def time_of_day1(m_offset)
  sprintf('%02d:%02d', m_offset % 1440 / 60, m_offset % 1440 % 60)
end

def time_of_day2(m_offset)
  days = m_offset /1440
  dow = DOW[(7 + days) % 7]
  hours = m_offset % 1440 / 60
  mins = m_offset % 1440 % 60
  dow + ' ' + sprintf('%02d:%02d', hours, mins)
end

def time_of_day(m_offset)
  sun_0000 = Time.new(2019,2,3)
  the_time = sun_0000 + m_offset * 60
  the_time.strftime('%A %H:%M')
end

puts time_of_day(4231)
puts time_of_day(-4231)

puts time_of_day(0) #== "00:00"
puts time_of_day(-3) #== "23:57"
puts time_of_day(35) #== "00:35"
puts time_of_day(-1437) #== "00:03"
puts time_of_day(3000) #== "02:00"
puts time_of_day(800) #== "13:20"
puts time_of_day(-4231) #== "01:29"
DEGREE = "\xC2\xB0"

def dms(num)
  degrees = num.to_i
  num = (num - degrees).round(2)
  minutes = (num * 60).to_i
  seconds = ((num * 60 - minutes) * 60).round()
  degrees.to_s + DEGREE + format('%02d', minutes.to_s) + "'" + format('%02d', seconds.to_s)  + '"'
end

def dms2(num)
  total_seconds = (num * 3600).round
  p num
  p num * 3600
  p total_seconds
  gets
  degrees, seconds_left = total_seconds.divmod(3600)
  p degrees
  p seconds_left
  gets
  minutes, seconds = seconds_left.divmod(60)
  p minutes
  p seconds
  gets
  format(%(#{degrees}#{DEGREE}%02d'%02d), minutes, seconds)
end

puts dms(30) #== %(30¡00'00")
puts dms(76.73) #== %(76¡43'48")
puts dms(254.6) #== %(254¡36'00")
puts dms(93.034773) #== %(93¡02'05")
puts dms(0) #== %(0¡00'00")
puts dms(360) #== %(360¡00'00") || dms(360) == %(0¡00'00")

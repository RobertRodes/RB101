def friday_13th(yr)
  counter = 0
  1.upto(12) do |mo|
    counter += 1 if Time.new(yr, mo, 13).friday?
  end
  counter
end

DAY = 86400
WEEK = 604800

def five_fridays(yr)
  year_counter = 0
  month_counter = 0
  
  current_day = Time.new(yr, 1, 1)
  current_day += DAY until current_day.friday?
  current_month = current_day.month
  
  while current_day.year == yr
    while current_day.month == current_month
      month_counter +=1
      current_day += WEEK
    end
    year_counter += 1 if month_counter > 4
    month_counter = 0
    current_month = current_day.month
  end
  
  year_counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

p five_fridays(2012)
p five_fridays(2013)
p five_fridays(2014)
p five_fridays(2015)
p five_fridays(2016)
p five_fridays(2017)
p five_fridays(2018)
p five_fridays(2019)
p five_fridays(2020)
p five_fridays(2021)

=begin
START
GET principal
GET apr
GET duration
SET monthly_rate = apr / 12
SET total_payments = duration * 12 

SET payment  = principal * (monthly_rate / (1 - (1 + monthly_rate)**(-total_payments)))

PRINT "Your monthly payment is: + payment
END
=end
def format_currency(num)
  num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end


print 'Principal? '
principal = gets.chomp.to_f
print 'APR? '
apr = gets.chomp.to_f
print 'Duration (in years)? '
duration = gets.chomp.to_f
monthly_rate = apr / 1200
total_payments = duration * 12
payment = principal * (monthly_rate / (1 - (1 + monthly_rate)**(-total_payments)))
puts "Your payment is $#{format_currency payment.round(2)}."
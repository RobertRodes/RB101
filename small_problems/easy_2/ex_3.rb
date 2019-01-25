loop do
  print 'What is the bill? '
  bill = gets.chomp.to_f
  break if bill == 0
  
  print 'What is the tip percentage? '
  tip_pct = gets.chomp.to_f / 100
  break if tip_pct == 0
  
  tip = (bill * tip_pct)
  
  puts "The tip is $#{format('%.2f', tip)}. The total bill is $#{format('%.2f', tip + bill)}."
end

def prompt(string)
  puts '==> ' + string
end

prompt 'Enter the first number:'
num_1 = gets.chomp.to_i
prompt 'Enter the second number:'
num_2 = gets.chomp.to_i

prompt "#{num_1} + #{num_2} = #{num_1 + num_2}."
puts
prompt "#{num_1} - #{num_2} = #{num_1 - num_2}."
puts
prompt "#{num_1} * #{num_2} = #{num_1 * num_2}."
puts
if num_2.zero?
  prompt "#{num_1} / #{num_2} =  ... Can't divide by zero."
  puts
  prompt "#{num_1} % #{num_2} =  ... Can't divide by zero."
else
  prompt "#{num_1} / #{num_2} = #{num_1 / num_2}."
  puts
  prompt "#{num_1} % #{num_2} = #{num_1 % num_2}."
end
puts
prompt "#{num_1} ** #{num_2} = #{num_1 ** num_2}."
puts

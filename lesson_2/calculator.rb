require 'yaml'

def prompt(message, newline = false)
  print "=> #{message}"
  print "\n" if newline == true
end

def valid_number?(num)
  num = num.to_s unless num.is_a? String
  /\A[+-]?\d+(\.[\d]+)?\z/.match(num)
end

def operation_to_message(op)
  retval =
    case op
    when 'a'
      'Adding'
    when 's'
      'Subtracting'
    when 'm'
      'Mutiplying'
    when 'd'
      'Dividing'
    end
  # Other code goes here
  retval
end

def message(msg)
  MESSAGES[@lang][msg]
end

prompt 'English or French (E, F)? '
@lang = 0 == gets.chomp.casecmp('f') ? 'fr' : 'en'

MESSAGES = YAML.load_file('calculator_messages.yml')

num1 = ''
num2 = ''
which_op = ''

name = ''

puts
prompt message 'welcome'
loop do
  name = gets.chomp
  break unless name.empty?
  prompt message 'valid_name'
end
puts
prompt "#{message 'hello'}, #{name}.", true
puts

loop do
  loop do
    prompt 'First number? '
    num1 = gets.chomp
    break if valid_number? num1
    prompt 'Not a valid number.', true
  end

  loop do
    prompt 'Second number? '
    num2 = gets.chomp
    break if valid_number? num2
    prompt 'Not a valid number.', true
  end

  prompt 'Add, subtract, multiply or divide (A, S, M, D)? '
  loop do
    which_op = gets.chomp.downcase
    break if %w(a s m d).include? which_op
    prompt "Enter A, S, M or D, please, #{name}: "
  end

  prompt "#{operation_to_message(which_op)} #{num1} and #{num2}...", true
  sleep 1

  num1 = num1.to_f == num1.to_i ? num1.to_i : num1.to_f.round(3)
  num2 = num2.to_f == num2.to_i ? num2.to_i : num2.to_f.round(3)
  op = ''

  result =
    case which_op.downcase
    when 'a'
      op = '+'
      num1 + num2
    when 's'
      op = '-'
      num1 - num2
    when 'm'
      op = '*'
      num1 * num2
    when 'd'
      if num2.zero?
        prompt("Division by zero. Can't do that!")
      else
        op = '/'
        num1.to_f / num2.to_f
      end
    end

  if result.is_a? String
    puts result
  else
    result = result == result.to_i ? result.to_i : result.round(3)
    puts
    prompt "#{name}, #{num1} #{op} #{num2} = #{result}", true
    puts
  end

  prompt 'Again (Y to continue)? '
  gets.chomp.downcase.start_with?('y') ? puts : break
end

puts
puts <<-BLOCK
A tree too big to embrace grows from the size of a hair,
A terrace of nine levels grows from heaps of earth,
A journey of a thousand \e[3mli\e[0m begins with a step.
 \e[3m-Lao Tzu\e[0m
BLOCK
puts
prompt "Bye, #{name}.", true

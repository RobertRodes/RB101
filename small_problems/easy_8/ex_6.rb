def fizzbuzz(num1, num2)
  (num1..num2).map do |num|
    if (num % 5).zero? && (num % 3).zero?
      'FizzBuzz'
    elsif (num % 3).zero?
      'Fizz'
    elsif (num % 5).zero?
      'Buzz'
    else
      num.to_s
    end
  end.join(', ')
end

puts fizzbuzz(1, 18)

def find_fibonacci_index_by_length1(number)
  number1 = 0
  number2 = 1
  cfib = 0
  counter = 1
  until cfib.to_s.length >= number
    counter += 1
    cfib = number1 + number2
    number1 = number2
    number2 = cfib
  end
  counter
end

def find_fibonacci_index_by_length4(number)
  number1 = 0
  number2 = 1
  cfib = 0
  counter = 0
  while cfib < 10 ** number
    counter += 1
    cfib = number1 + number2
    number1 = number2
    number2 = cfib
  end
  counter - 4
end

def find_fibonacci_index_by_length2(number)
  number1 = 0
  number2 = 1
  cfib = 0
  counter = 1
  until cfib.digits.count >= number
    counter += 1
    cfib = number1 + number2
    number1 = number2
    number2 = cfib
  end
  counter
end

def find_fibonacci_index_by_length3(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

x = Time.now
puts find_fibonacci_index_by_length1(1000)
puts Time.now - x

x = Time.now
puts find_fibonacci_index_by_length3(10000)
puts Time.now - x

x = Time.now
puts find_fibonacci_index_by_length4(10000)
puts Time.now - x

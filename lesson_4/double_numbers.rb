def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] *= 2
    counter += 1
  end
end

def double_numbers_odd!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] *= 2 if counter.odd?
    counter += 1
  end
end

def multiply(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] *= multiplier
    counter += 1
  end
end

my_numbers = [1, 4, 3, 7, 2, 6]

p double_numbers(my_numbers)
p my_numbers
puts
double_numbers!(my_numbers)
p my_numbers
puts
double_numbers_odd!(my_numbers)
p my_numbers
puts
multiply(my_numbers, 12)
p my_numbers

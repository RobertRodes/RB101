def show_multiplicative_average(arr)
  puts "The result is #{format('%.3f',(arr.inject(:*).to_f / arr.size))}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

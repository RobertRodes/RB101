require "pry" # add this to use Pry

counter = 5

loop do
  counter += 1
  binding.pry
  break if counter == 1
end

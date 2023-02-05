ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843,
         'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237 }

total_ages = 0
ages.each { |_, value| total_ages += value }
puts total_ages

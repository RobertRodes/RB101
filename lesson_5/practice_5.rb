# Sum the age of all male Munsters.

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

man_years = 0
man_years2 = 0

munsters.each do |_, value|
  man_years += value['age'] if value['gender'] == 'male'
end

munsters.each_value do |value|
  man_years2 += value['age'] if value['gender'] == 'male'
end

p man_years
p man_years2

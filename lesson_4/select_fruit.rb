def select_fruits(produce)
  result = {}
  counter = 0
  while counter < produce.size
    current_key = produce.keys[counter]
    if produce[current_key] == 'Fruit'
      result.store(current_key, produce[current_key])
    end
    counter += 1
  end
  result
end

def select_fruits2(produce)
  produce.select { |_, v| v == 'Fruit' }
end

def select_fruits3(produce)
  result = {}
  counter = 0
  loop do
    break if counter == produce.size
    current_key = produce.keys[counter]
    if produce[current_key] == 'Fruit'
      result.store(current_key, produce[current_key])
    end
    counter += 1
  end
  result
end

def select_fruits4(produce)
  result = {}
  counter = 0
  until counter == produce.size
    current_key = produce.keys[counter]
    if produce[current_key] == 'Fruit'
      result.store(current_key, produce[current_key])
    end
    counter += 1
  end
  result
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruits produce
p select_fruits2 produce
p select_fruits3 produce
p select_fruits4 produce

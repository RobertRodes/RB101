def penultimate(str)
  str.split[str.split.size - 2]
end

p penultimate 'Hi there. How are you today?'
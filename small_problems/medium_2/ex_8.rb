def featured(num)
  counter = num + 1
  counter += 1 until (counter % 7).zero? && counter.odd?
  while counter <= 9_876_543_201
    return counter if counter.digits.size == counter.digits.uniq.size
    counter += 14
  end
  'There is no possible number that fulfills the requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_876_543_200) == 9_987_543_201

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
# Sort the outer array elements, ignoring even numbers

arr = [[2, 6, 8], [2, 4, 10], [2, 7, 4]]
arr_orig = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# Solves the original problem, but dependent on the values. Didn't like it.
arr2 = arr_orig.sort_by { |a, b, c| b.odd? ? b : c }

p arr2

# Solves for all possible values, although if all values are even it sorts by the last one. And what if there are
# more or less than three values? The horror... the horror... On the wrong track here.
arr2 = arr.sort_by do |a, b, c|
  if a.odd?
    if b.odd?
      if c.odd?
        [a, b, c]
      else
        [a, b]
      end
    elsif c.odd?
      [a, c]
    else
      a
    end
  elsif b.odd?
    if c.odd?
      [b, c]
    else
      b
    end
  else
    c
  end
end

p arr2

# Peeked at the answer, long enough to see #select. Ok, simple. But what if you want to sort by the last value
# if all the values are even? This will do that.
arr2 = arr.sort_by do |sub_arr|
  temp = sub_arr.select(&:odd?)
  temp.empty? ? Array(sub_arr.last) : temp
end

p arr2

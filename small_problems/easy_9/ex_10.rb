def buy_fruit(arr)
  arr.each_with_object([]) { |v, a| v[1].times { a.push(v[0]) }}
end

def buy_fruit(arr)
  arr.each_with_index { |v1, v2, a| p v1 }
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) 
 #==
 # ["apples", "apples", "apples", "orange", "bananas","bananas"]
 
#p buy_fruit(['apples', 'oranges', 'bananas'])
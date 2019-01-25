arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [
          {
            first: ['a', 'b', 'c'],
            second: ['d', 'e', 'f']
          },
          {
            third: ['g', 'h', 'i']
          }
        ]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

puts arr1[2][1][3]
puts arr2[1][:third][0]
puts arr3[2][:third][0][0]
puts hsh1['b'][1]
puts hsh2[:third].keys[0]
puts hsh2[:third].key(0)
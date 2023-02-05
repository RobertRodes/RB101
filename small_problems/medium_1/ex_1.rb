def rotate_array(arr)
  new_arr = arr.clone
  new_arr.push new_arr.shift
end

def rotate_string(str)
  str[1..-1] + str[0]
end

def rotate_integer(int)
  (int.to_s[1..-1] + int.to_s[0]).to_i
end

arr = [1, 2, 3, 4, 5]
p rotate_array(arr)
p arr

str = 'abcde'
p rotate_string(str)
p str

int = 12345
int2 = 10234
p rotate_integer(int)
p int
p rotate_integer(int2)
p int2
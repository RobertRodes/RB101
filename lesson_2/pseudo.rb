# 1a.
Get two integers, a and b.
Add a and b.
Print the result, in the form "[a] +  [b] = [result]."

# 1b.
START

GET a # addend 1
GET b # addend 2
SET result = a + b.
PRINT READ(a) " + " READ(b) " = " READ(result)

END

# 2a.
Given an array of strings called strings.
Create a variable called result, set to empty string.
Create a variable called counter, set to 0.
Iterate the strings array. In each iteration:
  - Read the array element in strings whose offset matches counter; add it onto the end of result.
  - Increment counter.
Return result.

# 2b.
START

GIVEN an array of strings called strings.
SET result = empty string.
SET counter = 0.
WHILE counter < size of strings
  READ strings [counter]
  SET result = result concatenated to strings[counter].
  SET counter = counter + 1.
RETURN result.

END

# 3a.

Given an array of integers.
Create a new array.
Iterate the first array. In each iteration:
  - If the offset is an odd number, push the element onto the new array.
  - Otherwise, skip to the next iteration.
Return the new array.

# 3b.
START

GIVEN an array of integers called ints.
SET odd_ints = new array.
SET counter = 0.
WHILE counter < size of ints
  IF counter is odd
    READ ints[counter].
    SET odd_ints[counter] = ints[counter].
  ELSE
    Skip iteration: do nothing.
  SET counter = counter + 1.
RETURN odd_ints.

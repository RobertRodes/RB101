def transpose(matrix)
  new_matrix = []

  3.times do |i|
    new_matrix.push([])
    3.times do |j|
      new_matrix[i] << matrix[j][i]
    end
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix
p matrix
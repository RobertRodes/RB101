def transpose(matrix)
  new_matrix = []

  matrix[0].size.times do |i|
    new_matrix.push([])
    matrix.size.times do |j|
      new_matrix[i] << matrix[j][i]
    end
  end
  new_matrix
end

matrix = [
  [1, 5, 8, 4],
  [4, 7, 2, 3],
  [3, 9, 6, 2]
]

new_matrix = transpose(matrix)

p new_matrix
p matrix
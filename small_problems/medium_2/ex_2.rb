BLOCKS = [
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']
].freeze

def block_word?(word)
  word.upcase!
  used_blocks = [].fill(false, 0..BLOCKS.size - 1)
  word.chars.each do |w|
    idx = BLOCKS.index { |a| a.include?(w) }
    if idx.nil? || used_blocks[idx]
      return false
    else
      used_blocks[idx] = true
    end
  end
  true
end

p block_word?('Quixotic')
exit
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
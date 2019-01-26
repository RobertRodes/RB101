HUMAN_PLAYER = 'human'.freeze
COMPUTER_PLAYER = 'computer'.freeze
CHOOSE_PLAYER = 'choose'.freeze
NUMBER_TEXT = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine'
}.freeze

FIRST_PLAYER = CHOOSE_PLAYER.freeze
UNBEATABLE = false
MATCH_GAMES = 3

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

def alternate_player(current_player)
  current_player == HUMAN_PLAYER ? COMPUTER_PLAYER : HUMAN_PLAYER
end

def board_full?(board)
  board.key(' ').nil?
end

def board_line(board, the_line)
  line = the_line * 3 + 1
  puts "  #{board[line]}  |  #{board[line + 1]}  |  #{board[line + 2]}"
end

# rubocop:disable Metrics/CyclomaticComplexity
def computer_move(board)
  choice = find_at_risk_square(board, COMPUTER_MARKER)
  choice = find_at_risk_square(board, PLAYER_MARKER) if choice.nil?
  choice = 5 if board[5] == INITIAL_MARKER && choice.nil?
  choice = board.slice(1, 3, 7, 9).key(INITIAL_MARKER) if choice.nil? && UNBEATABLE
  choice = empty_squares(board).sample if choice.nil?
  choice
end
# rubocop:enable Metrics/CyclomaticComplexity

def detect_winner(board)
  WINNING_LINES.each do |line|
    return 'You' if board.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if board.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(board, first_player)
  show_header
  if @alternate_starters
    variable_text = first_player == HUMAN_PLAYER ? 'Your' : "Computer\'s"
    puts "Alternating starters. #{variable_text} turn to go first."
  else
    puts "#{first_player == HUMAN_PLAYER ? 'You go' : 'Computer goes'} first."
  end
  puts
  puts
  puts '     |     |'
  board_line(board, 0)
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  board_line(board, 1)
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  board_line(board, 2)
  puts '     |     |'
  puts
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def empty_squares(board)
  board.keys.select { |key| board[key] == INITIAL_MARKER }
end

def find_at_risk_square(board, check_which)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(check_which) == 2
      return board.select { |k, _| line.include?(k) }.key(INITIAL_MARKER)
    end
  end
  nil
end

def first_player_choice
  show_header
  prompt 'Who goes first: player, computer or alternate (P/C/A)? '
  case gets.chomp.downcase
  when 'c'
    return COMPUTER_PLAYER
  when 'a'
    @alternate_starters = true
    prompt 'Who will start (P/C)? '
    gets.chomp.casecmp('c').zero? ? COMPUTER_PLAYER : HUMAN_PLAYER
  else
    HUMAN_PLAYER
  end
end

def init_board
  new_board = {}
  (1..9).each { |key| new_board[key] = INITIAL_MARKER }
  new_board
end

def join_or(arr, join_delim = ', ', last_join_word = 'or')
  return arr.join if arr.size <= 1
  last_char = arr.pop.to_s
  arr.join(join_delim).concat(' ' + last_join_word + ' ' + last_char)
end

def make_move(which_player, board)
  if which_player == HUMAN_PLAYER
    player_move(board)
  else
    computer_move(board)
  end
end

def player_move(board)
  choice = nil
  loop do
    print "Choose a square (#{join_or(empty_squares(board))}): "
    choice = gets.chomp.to_i
    break if board[choice] == INITIAL_MARKER
    prompt 'Invalid choice.', true
  end
  choice
end

def prompt(message, newline = false)
  print "=> #{message} "
  print "\n" if newline
end

def prompt_next(player_score, computer_score)
  if player_score == MATCH_GAMES
    prompt "You win the match, #{MATCH_GAMES} to #{computer_score}! Play again (Y/N)? "
  elsif computer_score == MATCH_GAMES
    prompt "Computer wins the match, #{MATCH_GAMES} to #{player_score}. Play again (Y/N)? "
  elsif player_score > computer_score
    prompt "You lead, #{player_score} to #{computer_score}. Keep playing (Y/N)?"
  elsif computer_score > player_score
    prompt "Computer leads, #{computer_score} to #{player_score}. Keep playing (Y/N)?"
  else
    prompt "All even, #{player_score} to #{computer_score}. Keep playing (Y/N)?"
  end
end

def show_header
  system 'clear'
  wins_text =
    if MATCH_GAMES == 1
      'win'
    elsif MATCH_GAMES >= 9
      MATCH_GAMES.to_s + ' wins'
    else
      NUMBER_TEXT[MATCH_GAMES] + ' wins'
    end
  puts "Welcome to Tic-Tac-Toe. First #{wins_text} takes the match."
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
end

def someone_won?(board)
  !!detect_winner(board)
end

def swap_first_player(last_to_start)
  last_to_start == HUMAN_PLAYER ? COMPUTER_PLAYER : HUMAN_PLAYER
end

@alternate_starters = false
first_player = FIRST_PLAYER == 'choose' ? first_player_choice : FIRST_PLAYER
current_player = first_player

player_score = 0
computer_score = 0

loop do
  board = init_board
  loop do
    display_board(board, first_player)
    square = make_move(current_player, board)
    board[square] = current_player == HUMAN_PLAYER ? PLAYER_MARKER : COMPUTER_MARKER
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, first_player)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} win#{winner == 'You' ? '' : 's'} this round.", true
    winner == 'You' ? player_score += 1 : computer_score += 1
  else
    prompt 'This round is tied.', true
  end
  puts

  prompt_next(player_score, computer_score)
  break unless gets.chomp.casecmp('y').zero?

  if player_score == MATCH_GAMES || computer_score == MATCH_GAMES
    player_score = 0
    computer_score = 0
  end

  first_player = swap_first_player(first_player) if @alternate_starters
  current_player = first_player
end

system 'clear'
puts
puts 'May your days be many, and your steps light.'
puts

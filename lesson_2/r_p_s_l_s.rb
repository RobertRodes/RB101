require 'English'

CHOICES = %w(R P S L K).freeze

CH_LONG = {
  R: 'rock',
  P: 'paper',
  S: 'scissors',
  L: 'lizard',
  K: 'Spock'
}.freeze

WIN_RULES = {
  KL: 'Lizard poisons Spock. ',
  KR: 'Spock vaporizes rock. ',
  KP: 'Paper refutes Spock. ',
  KS: 'Spock smashes scissors. ',
  LP: 'Lizard eats paper. ',
  LR: 'Rock crushes lizard. ',
  LS: 'Scissors decapitates lizard. ',
  PR: 'Paper covers rock. ',
  PS: 'Scissors cuts paper. ',
  RS: 'Rock smashes scissors. '
}.freeze

at_exit do
  if !$ERROR_INFO.nil? && $ERROR_INFO.success?
    puts <<-BLOCK

    May your blessings be many,
    And may your footprints upon the path
    Be stars that light others the way.

    BLOCK
  else
    puts <<-BLOCK
    
    Thank you for playing rock-paper-scissors-lizard-Spock.
    
    BLOCK
  end
end

def input_choice
  choice = ''
  loop do
    prompt 'Rock, paper, scissors, lizard or Spock (R, P, S, L, K, Enter to quit)? '
    choice = gets.chomp[0]
    exit if choice.nil?
    break if CHOICES.include?(choice.upcase)
    prompt 'Invalid choice. Please try again.', true
    puts
  end
  choice.upcase
end

def get_result_message(winner, player_choice, computer_choice)
  choice_string = player_choice + computer_choice
  win_condition = WIN_RULES[choice_string.chars.sort.join.to_sym]

  case winner
  when 'tie'
    "It's a tie."
  when 'player'
    win_condition + 'You win.'
  when 'computer'
    win_condition + 'I win.'
  end
end

def get_winner(player_choice, computer_choice)
  choice_string = player_choice + computer_choice
  if player_choice == computer_choice
    'tie'
  elsif %w(KR KS LK LP PK PR PS RL RS SL).include?(choice_string)
    'player'
  else
    'computer'
  end
end

def prompt(message, newline = false)
  print '=> ' + message
  print "\n" if newline
end

# Start main

player_wins = 0
my_wins = 0

# Header
puts
puts <<-BLOCK
\e[1m\e[32mWelcome to rock-paper-scissors-lizard-Spock! \e[0m

First to five wins is the Grand Champion.
BLOCK
puts

# Play the game
loop do
  choice = input_choice
  puts

  my_choice = CHOICES.sample

  choice_long = CH_LONG[choice.to_sym]
  my_choice_long = CH_LONG[my_choice.to_sym]

  print "You chose #{choice_long}, and I chose #{my_choice_long}. "

  winner = get_winner choice, my_choice
  case winner
  when 'player'
    player_wins += 1
  when 'computer'
    my_wins += 1
  end

  puts get_result_message winner, choice, my_choice
  puts

  if player_wins == 5
    puts <<-BLOCK
    That's five wins. You are the Grand Champion!
    Score: You 5  Me #{my_wins}.
    BLOCK
  elsif my_wins == 5
    puts <<-BLOCK
    That's five wins. I am the Grand Champion!
    Score: You #{player_wins}  Me 5.
    BLOCK
  else
    puts <<-BLOCK
    Score: You #{player_wins}  Me #{my_wins}.
    BLOCK
    puts
    next
  end
  puts

  prompt('Play again? ')
  break unless gets.chomp.upcase.start_with? 'Y'

  # Zero out the win counters and start over.
  puts
  player_wins = 0
  my_wins = 0
end

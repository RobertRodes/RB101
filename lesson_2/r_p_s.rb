require 'English'

CHOICES = %w(R P S).freeze
CH_LONG = %w(rock paper scissors).freeze

at_exit do
  if !$ERROR_INFO.nil? && $ERROR_INFO.success?
    puts <<-BLOCK
    May your blessings be many,
    And may your footprints upon the path
    Be stars that light others the way.
    BLOCK
  else
    puts 'Thank you for playing rock, paper, scissors.'
  end
end

def prompt(message, newline = false)
  print '=> ' + message
  print "\n" if newline
end

def get_win_condition(choice_string)
  case choice_string.chars.sort.join
  when 'PR'
    'Paper covers rock. '
  when 'PS'
    'Scissors cuts paper. '
  when 'RS'
    'Rock smashes scissors. '
  else
    ''
  end
end

def get_winner(player_choice, computer_choice)
  choice_string = player_choice + computer_choice

  if player_choice == computer_choice
    "It's a tie."
  elsif %w(PR RS SP).include?(choice_string)
    get_win_condition(choice_string) + 'You win.'
  else
    get_win_condition(choice_string) + 'I win.'
  end
end

# Start main

choice = ''

loop do
  prompt "Rock, paper or scissors (#{CHOICES.join ', '}, Enter to quit)? "
  choice = gets.chomp[0]
  exit if choice.nil?
  choice.replace(choice.upcase)

  unless CHOICES.include?(choice)
    prompt 'Invalid choice. Please try again.', true
    next
  end

  my_choice = CHOICES.sample

  long_choice =
    CH_LONG[CH_LONG.find_index { |i| i.start_with? choice.downcase }]
  my_long_choice =
    CH_LONG[CH_LONG.find_index { |i| i.start_with? my_choice.downcase }]

  puts "You chose #{long_choice}, and I chose #{my_long_choice}."
  puts get_winner choice, my_choice

  prompt('Again? ')
  break unless gets.chomp.upcase.start_with? 'Y'
end

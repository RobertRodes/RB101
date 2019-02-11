require 'io/console'

### A deck of cards

CARD_VALUE = {
  '2'  => 2,
  '3'  => 3,
  '4'  => 4,
  '5'  => 5,
  '6'  => 6,
  '7'  => 7,
  '8'  => 8,
  '9'  => 9,
  '10' => 10,
  'J'  => 10,
  'Q'  => 10,
  'K'  => 10,
  'A'  => 11
}.freeze

NUMBERS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze

SUITS = ["\u2660", "\u2661", "\u2662", "\u2663"].freeze

### Game settings

BET = 1
PLAYER_STAKE = 50

### Game rules settings

NATURAL_MULTIPLIER = 10
BUST_VALUE = 21
DEALER_STAND_VALUE = 17

### Game behavior

APPLY_BET = {
  player_natural: BET * NATURAL_MULTIPLIER,
  dealer_bust:    BET,
  player:         BET,
  push:           0,
  natural_push:   0,
  dealer:         -BET,
  player_bust:    -BET,
  dealer_natural: -BET
}.freeze

# Maximum possible cards in a two-player hand is 18. Dealer can have 7
# (2*4 + 3*3 = 17) and player can have 11 (1*4 + 2*4 + 3*3).
# This constant sets the remaining card count to trigger a deck reset.
# Changing BUST_VALUE should change NEW_DECK_COUNT as well; a too
# low new deck count will cause errors trying to deal from an empty deck.
NEW_DECK_COUNT = 18

SLEEP_TIME = 1 # How long to wait between dealer cards dealt, etc.

KEY_ONLY = true # Key + enter or key only

### Game layout settings

HAND_RESULT_PROMPT = {
  player_natural: "Player holds a natural #{BUST_VALUE}! Player wins.",
  dealer_bust:    'Dealer busted. Player wins.',
  player:         'Player wins.',
  natural_push:   "Dealer and player both hold a natural #{BUST_VALUE}! " \
                    "That's a push.",
  push:           'Push.',
  dealer:         'Dealer wins.',
  player_bust:    'Player busted. Dealer wins.',
  dealer_natural: "Dealer holds a natural #{BUST_VALUE}. Dealer wins."
}.freeze

NATURAL_YES = 'Yep!'.freeze
NATURAL_NO = 'Nope!'.freeze

SCREEN_WIDTH = 60

GameData = Struct.new(
  :deck,
  :player_cash,
  :show_dealer,
  :player_hand,
  :player_score,
  :dealer_hand,
  :dealer_score,
  :hand_result,
  :prompts
)

GamePrompts = Struct.new(
  :player_cash,
  :dealer_score,
  :player_score,
  :check_natural,
  :hand_result
)

def apply_hand_result(data)
  data.player_cash += APPLY_BET[data.hand_result]
end

def calc_hand_result(data)
  return :player_bust if data.player_score > BUST_VALUE
  return nil unless data.show_dealer
  return :dealer_bust if data.dealer_score > BUST_VALUE
  case data.player_score <=> data.dealer_score
  when 1
    :player
  when -1
    :dealer
  else
    :push
  end
end

def calc_total(hand)
  total = 0

  hand.each do |card|
    total += CARD_VALUE[card[0]]
  end

  aces = hand.count { |a| a[0] == 'A' }
  while total > BUST_VALUE && aces > 0
    total -= 10
    aces -= 1
  end

  total
end

def check_natural(data)
  return :natural_push    if data.dealer_score == BUST_VALUE &&
                             data.player_score == BUST_VALUE
  return :dealer_natural  if data.dealer_score == BUST_VALUE
  return :player_natural  if data.player_score == BUST_VALUE
  nil
end

def closing_message(data)
  case data.player_cash <=> PLAYER_STAKE
  when -1 then "You have lost $#{PLAYER_STAKE - data.player_cash}. \n\n" \
    'But not to worry. Just spend a year washing dishes in our kitchen ' \
    "and we'll call it even.\n\nSee you tomorrow!"
  when 1 then "You have won $#{data.player_cash - PLAYER_STAKE}. We'll be " \
    "keeping the money, of course. After all, it was ours to begin with.\n\n" \
    'Stop back and see us again!'
  else 'You have broken even. Oh, well, maybe next time.'
  end
end

def create_hand_view(data, whose)
  if whose == :dealer
    return data.dealer_hand[0].join(' ') unless data.show_dealer
    hand = data.dealer_hand
  else
    hand = data.player_hand
  end
  hand_view = ''
  hand.each_with_index do |card, i|
    hand_view << card.join(' ')
    hand_view << '  ' unless i + 1 == hand.size
  end
  hand_view
end

def deal_hand(deck)
  hand = []
  2.times do
    hand.push deck.pop
  end
  hand
end

def dealer_check_natural(data)
  the_prompt = "Dealer is checking for a natural #{BUST_VALUE} ... "
  print word_wrap(the_prompt)
  wait SLEEP_TIME

  if data.dealer_score == BUST_VALUE
    print "#{NATURAL_YES}\n"
    the_prompt << NATURAL_YES
  else
    print "#{NATURAL_NO}\n\n"
    the_prompt << NATURAL_NO
  end

  data.prompts.check_natural = the_prompt
end

def dealer_turn(data)
  data.show_dealer = true

  loop do
    show_table(data)
    wait SLEEP_TIME
    break if data.dealer_score >= DEALER_STAND_VALUE
    hit!(data.dealer_hand, data.deck)
    data.dealer_score = calc_total(data.dealer_hand)
  end
end

def getchar
  if KEY_ONLY
    char = STDIN.getch
    exit if char == "\u0003"
  else
    char = gets.chomp[0]
  end
  char
end

def hit!(hand, deck)
  hand.push deck.pop
end

def new_deck
  NUMBERS.product(SUITS).shuffle
end

def new_hand!(data)
  data.show_dealer = false
  data.player_hand = deal_hand(data.deck)
  data.dealer_hand = deal_hand(data.deck)
  data.player_score = calc_total(data.player_hand)
  data.dealer_score = calc_total(data.dealer_hand)
  data.hand_result = nil
  data.prompts.check_natural = nil
end

def player_decision
  loop do
    prompt 'Hit or stand (H or S)? '
    play = getchar
    return play if 'hs'.downcase.chars.include?(play)
    prompt "\nInvalid value. Please try again.", true
  end
end

def player_turn(data)
  data.prompts.check_natural = nil
  loop do
    play = player_decision

    if play == 'h'
      hit!(data.player_hand, data.deck)
      data.player_score = calc_total(data.player_hand)
      show_table(data)
    end

    break if data.player_score > BUST_VALUE || play == 's'
  end
end

def prompt(message, newline = false)
  print "=> #{message}"
  print "\n" if newline
end

def show_opening_screen
  system 'clear'
  print "\n" + "Bob's Black Jack".center(SCREEN_WIDTH) + "\n\n"
  print "Welcome!\n\n"
  print word_wrap "You have been awarded a gambling spree at Bob's Black " \
    "Jack, our favorite casino! \n\n" \
    'Black Jack is the game we play...sort of. No doubling down, and no ' \
    "splitting pairs. \n\n" \
    "You have $#{PLAYER_STAKE} to play with. Bet is $#{BET} per hand. \n\n" \
    "Black Jack pays #{NATURAL_MULTIPLIER} to 1. \n\n"
  prompt word_wrap("Please hit #{KEY_ONLY ? 'any key' : '"Enter"'} when you are ready to begin: ")
  getchar
end

def show_closing_screen(data)
  str_message = closing_message(data) # Hey, it's a rubocop thing.
  system 'clear'
  print "\n" + "Bob's Black Jack".center(SCREEN_WIDTH) + "\n\n"
  print word_wrap "Thank you for playing at Bob's Black Jack!\n\n"
  print word_wrap "#{str_message}\n\n"
  print word_wrap "Please hit #{KEY_ONLY ? 'any key' : '"Enter"'} to leave: "
  getchar
  print "\n\n"
end

def show_table(data)
  system 'clear'
  show_table_inner(data)
  update_prompts(data)
  data.prompts.to_a.each do |v|
    puts word_wrap(v) unless v.nil?
    puts unless v.nil?
  end
end

def show_table_inner(data)
  puts
  puts "Bob's Black Jack".center(SCREEN_WIDTH)
  puts
  puts 'Dealer'.center(SCREEN_WIDTH)
  puts create_hand_view(data, :dealer).center(SCREEN_WIDTH)
  print "\n\n"
  puts create_hand_view(data, :player).center(SCREEN_WIDTH)
  puts 'Player'.center(SCREEN_WIDTH)
  print "\n\n"
end

def update_prompts(data)
  data.prompts.dealer_score =
    "Dealer score:   #{data.show_dealer ? data.dealer_score : '??'}"
  data.prompts.player_score = "Player score:   #{data.player_score}"
  data.prompts.player_cash = "Player cash:   $#{data.player_cash.abs}"
  data.prompts.player_cash << ' in the hole' if data.player_cash < 0
  data.prompts.hand_result = HAND_RESULT_PROMPT[data.hand_result]
end

def wait(for_time)
  system('stty raw -echo')
  sleep for_time
  system('stty -raw echo')
end

# Assumes "space plus \n\n" for new paragraph.
def word_wrap(str)
  char_count = 0
  lastchar = str.end_with?(' ') ? ' ' : ''
  str.split(/ /).each do |word|
    char_count += word.size + 1
    if char_count > SCREEN_WIDTH
      word.prepend("\n") unless word.start_with?("\n\n")
      char_count = word.size + 1
    end
    char_count = word.size - 1 if word.include?("\n\n")
  end.join(' ') << lastchar
end

data = GameData.new(
  new_deck,     # deck
  PLAYER_STAKE, # player_cash
  false,        # show_dealer
  nil,          # player_hand
  nil,          # player_score
  nil,          # dealer_hand
  nil,          # dealer_score
  nil,          # hand_result
  {}            # prompts
)

data.prompts = GamePrompts.new(
  "Player cash:   $#{data.player_cash}",
  nil,
  nil,
  nil
)

show_opening_screen

loop do
  new_hand!(data)
  show_table(data)

  unless BUST_VALUE > 21
    dealer_check_natural(data) if CARD_VALUE[data.dealer_hand[0][0]] >= 10
    data.hand_result = check_natural(data)
  end

  if data.hand_result.nil?
    player_turn(data)
    data.hand_result = calc_hand_result(data)
    if data.hand_result.nil?
      dealer_turn(data)
      data.hand_result = calc_hand_result(data)
    end
  end

  apply_hand_result(data)
  data.show_dealer = true
  show_table(data)

  prompt word_wrap("Please #{KEY_ONLY ? 'hit' : 'enter'} Q to quit, or anything else to play again: ")
  char = getchar
  print "\n"
  break if !char.nil? && char.casecmp('q').zero?
  exit if char == "\u0003"

  data.deck = new_deck if data.deck.count <= NEW_DECK_COUNT
end

show_closing_screen(data)

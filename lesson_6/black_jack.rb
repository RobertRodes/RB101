require 'io/console'

CARD_VALUE = {
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '10' => 10,
  'J' => 10,
  'Q' => 10,
  'K' => 10,
  'A' => 11
}.freeze

NUMBERS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
SUITS = ['H', 'C', 'S', 'D'].freeze

SLEEP_TIME = 1

# Maximum possible cards in a two-player hand is 18. Dealer can have 7 (2*4 + 3*3 = 17)
# and player can have 11 (1*4 + 2*4 + 3*3). This constant sets how many cards
# remaining in the existing deck triggers creation of a new deck.
NEW_DECK_COUNT = 18 

SCREEN_WIDTH = 40

def new_deck
  NUMBERS.product(SUITS).shuffle
end

def deal_hand(deck)
  hand = []

  2.times do
    hand.push deck.pop
  end

  hand
end

def calc_total(hand)
  total = 0

  hand.each do |card|
    total += CARD_VALUE[card[0]]
  end

  aces = hand.count { |a| a[0] == 'A' }
  while total > 21 && aces > 0
    total -= 10
    aces -= 1
  end

  total
end

def get_char
  char = STDIN.getch
  exit if char == "\u0003"
  char
end

def hit(hand, deck)
  hand.push deck.pop
end

def prompt(message, newline = false)
  print "=> #{message}"
  print "\n" if newline
end

def opening_screen
  system 'clear'
  puts 
  puts "Welcome! You have been awarded a gambling spree at our favorite casino!"
  puts 'Black jack is the game we play...sort of. No doubling down, no splitting pairs.'
  puts
  prompt 'Please hit any key when you are ready to begin.', true
  get_char
end

def create_hand_view(hand)
  hand_view = ''
  hand.each_with_index do |card, i|
    hand_view << card.join(' ')
    hand_view << ', ' unless i + 1 == hand.size
  end
  hand_view
end

def show_table(player_hand, dealer_hand, player_score, dealer_score = 0)
  player_hand_view = create_hand_view(player_hand)

  dealer_hand_view = dealer_score > 0 ? create_hand_view(dealer_hand) : dealer_hand[0].join(' ')

  system 'clear'
  puts 'Blackjack'.center(SCREEN_WIDTH)
  puts
  puts 'Dealer'.center(SCREEN_WIDTH)
  puts dealer_hand_view.center(SCREEN_WIDTH)
  puts
  puts
  puts player_hand_view.center(SCREEN_WIDTH)
  puts 'You'.center(SCREEN_WIDTH)
  puts
  puts
  puts 'Dealer score: ' + dealer_score.to_s if dealer_score > 0
  puts 'Your score: ' + player_score.to_s
  puts
end

def player_turn(dealer_hand, player_hand, deck)
  score = calc_total(player_hand)
  show_table(player_hand, dealer_hand, score)

  loop do
    play = ''

    loop do
      prompt 'Hit or stand (H or S)? '
      play = get_char
      
      break if 'hs'.chars.include?(play)
      prompt 'Invalid value. Please try again.', true
    end

    if play == 'h'
      hit(player_hand, deck)
      score = calc_total(player_hand)
      show_table(player_hand, dealer_hand, score)
    end

    if score > 21 || play == 's'
      break
    end
  end

  score
end

def dealer_turn(dealer_hand, player_hand, player_score, deck)
  score = calc_total(dealer_hand)

  loop do
    show_table(player_hand, dealer_hand, player_score, score)
    sleep SLEEP_TIME
    break if score >= 17
    hit dealer_hand, deck
    score = calc_total dealer_hand
  end

  score
end

def check_natural(dealer_hand, player_hand)
  dealer_score = calc_total(dealer_hand)
  player_score = calc_total(player_hand)

  show_table(player_hand, dealer_hand, player_score)

  if CARD_VALUE[dealer_hand[0][0]] >= 10
    prompt 'Dealer is checking for a natural 21 ... '
    sleep SLEEP_TIME
    unless dealer_score == 21
      print "Nope!\n" 
      sleep SLEEP_TIME
    end
  end

  if player_score == 21 && dealer_score == 21
    show_table(player_hand, dealer_hand, player_score, dealer_score)
    prompt 'Dealer holds a natural 21, and so do you. Push.', true
  elsif player_score == 21
    show_table(player_hand, dealer_hand, player_score)
    prompt 'You hold a natural 21. You win.', true
  elsif dealer_score == 21
    show_table(player_hand, dealer_hand, player_score, dealer_score)
    prompt 'Dealer holds a natural 21. Dealer wins.', true
  else
    return false
  end
  
  true
end

opening_screen

deck = new_deck

loop do
  dealer_hand = deal_hand(deck)
  player_hand = deal_hand(deck)
  
  unless check_natural(dealer_hand, player_hand)
    player_score = player_turn(dealer_hand, player_hand, deck)
    if player_score > 21
      prompt 'Busted. Dealer wins.', true
    else
      dealer_score = dealer_turn(dealer_hand, player_hand, player_score, deck)
      if dealer_score > 21
        prompt 'Dealer busted. Player wins.', true
      elsif player_score > dealer_score
        prompt 'Player wins.', true
      elsif dealer_score > player_score
        prompt 'Dealer wins.', true
      else
        prompt 'Push.', true
      end
    end
  end
  
  prompt 'Enter Q to quit, or any other key to play again: '
  char = get_char
  break if char.casecmp('q').zero?
  exit if char == "\u0003"
  deck = new_deck if deck.count <= NEW_DECK_COUNT
end

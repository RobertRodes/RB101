# require 'pry'

CARD_VALUES = {
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

STARTING_CASH_STRING = '10,000'.freeze

NEW_DECK_COUNT = 21

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
    total += CARD_VALUES[card[0]]
  end

  aces = hand.count { |a| a[0] == 'A' }
  while total > 21 && aces > 0
    total -= 10
    aces -= 1
  end

  total
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
  prompt 'Please hit any key when you are ready to begin. (Except Ctrl-C. Don\'t hit that.)', true
  gets
  bet
end

def create_hand_view(hand)
  hand_view = ''
  hand.each_with_index do |card, i|
    hand_view << card.join(' ')
    hand_view << ', ' unless i + 1 == hand.size
  end
  hand_view
end

def show_table(dealer_hand, player_hand, player_stand, player_score, dealer_score = 0)
  player_hand_view = create_hand_view(player_hand)

  dealer_hand_view = player_stand ? create_hand_view(dealer_hand) : dealer_hand[0].join(' ')

  system 'clear'
  puts 'Blackjack v. 0.0.0.1'.center(SCREEN_WIDTH)
  puts
  puts 'Dealer'.center(SCREEN_WIDTH)
  puts dealer_hand_view.center(SCREEN_WIDTH)
  puts 'Dealer score: ' + dealer_score.to_s if !dealer_score.zero?
  puts
  puts
  puts player_hand_view.center(SCREEN_WIDTH)
  puts 'You'.center(SCREEN_WIDTH)
  puts 'Your score: ' + player_score.to_s
  puts
end

def player_turn(dealer_hand, player_hand, bet, deck)
  score = calc_total(player_hand)
  show_table(dealer_hand, player_hand, false, bet, score)

  loop do
    move = ''

    loop do
      prompt 'Hit or stand (H or S; Q to quit)? '
      move = gets.chomp.downcase
      break if 'hs'.include?(move)
      prompt 'Invalid value. Please try again.', true
    end

    if move == 'h'
      hit(player_hand, deck)
      score = calc_total(player_hand)
      show_table(dealer_hand, player_hand, false, bet, score)
    end

    if score > 21 || move == 's'
      break
    end
  end

  score
end

def dealer_turn(dealer_hand, player_hand, player_score, bet, deck)
  score = calc_total(dealer_hand)

  loop do
    show_table(dealer_hand, player_hand, true, bet, player_score, score)
    sleep 0.5
    break if score >= 17
    hit dealer_hand, deck
    score = calc_total dealer_hand
  end

  score
end

opening_screen

deck = new_deck

loop do
  dealer_hand = deal_hand(deck)
  player_hand = deal_hand(deck)

  player_score = player_turn(dealer_hand, player_hand, bet, deck)
  if player_score > 21
    prompt 'Busted. Dealer wins.', true
  else
    dealer_score = dealer_turn(dealer_hand, player_hand, player_score, bet, deck)
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

  prompt 'Hit C to change bet, Q to quit, any other key to play again: '
  break if gets.chomp.casecmp('q').zero?
  deck = new_deck if deck.count <= NEW_DECK_COUNT
end

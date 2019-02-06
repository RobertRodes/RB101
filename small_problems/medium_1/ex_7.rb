DIGIT_WORDS = {
'0' => 'zero',
'1' => 'one',
'2' => 'two',
'3' => 'three',
'4' => 'four',
'5' => 'five',
'6' => 'six',
'7' => 'seven',
'8' => 'eight',
'9' => 'nine'
}.freeze

def word_to_digit(str)
  new_str = str
  DIGIT_WORDS.each do |key, val|
    reg = Regexp.union([/#{val.capitalize} /, /#{val.upcase} /, /#{val}\s/])
    new_str.gsub!(reg, key)
    phone = new_str.scan(/\d{10}/)
    if phone.size == 1
      phone = phone.join
      phone = '(' + phone[0..2] + ') ' + phone[3..5] + '-' + phone[6..9]
      new_str.gsub!(/\d{10}/, phone)
    end
  end
  new_str
end

p word_to_digit('One 2 3 FOUR five up the road and down to Dublin 5 times')
p word_to_digit('My cell number is two four eight eight six seven five three zero nine .')
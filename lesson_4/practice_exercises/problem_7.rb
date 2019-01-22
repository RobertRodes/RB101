require 'benchmark'

ALPHABET = (('A'..'Z').to_a + ('a'..'z').to_a).join.freeze

def count_letters(the_string)
  counter = 0
  result = {}
  until counter == the_string.size
    current_char = the_string[counter]
    counter += 1
    next unless ALPHABET.include? current_char

    if result.include?(current_char.to_sym)
      result[current_char.to_sym] += 1
    else
      result[current_char.to_sym] = 1
    end
  end
  result.sort.to_h
end

def count_letters2(the_string)
  result = {}
  the_string.chars.each do |letter|
    next unless ALPHABET.include? letter
    if result.include?(letter.to_sym)
      result[letter.to_sym] += 1
    else
      result[letter.to_sym] = 1
    end
  end
  result.sort.to_h
end

def count_letters3(the_string)
  result = {}
  letters = ('A'..'Z').to_a + ('a'..'z').to_a
  letters.each do |letter|
    letter_frequency = the_string.scan(letter).count
    result[letter] = letter_frequency if letter_frequency > 0
  end
  result
end

# statement = 'The Flintstones Rock'
# p count_letters2 statement

statement = <<-BLOCK
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non ligula congue, fringilla nibh
vel, convallis odio. Ut aliquam vulputate rutrum. Curabitur ultricies vehicula vulputate.
Suspendisse rhoncus justo eget ornare convallis. Pellentesque sem eros, pharetra non nisi sagittis,
sodales auctor elit. Nunc accumsan quam feugiat scelerisque ultricies. Fusce vehicula neque sit
amet iaculis bibendum. In vel ligula orci. Nunc dapibus sit amet massa eget placerat. Nullam tempor
ullamcorper leo, non sollicitudin nisl scelerisque vitae. Praesent nec lorem vel lectus iaculis
laoreet.

Donec sollicitudin, erat vel suscipit tristique, felis quam blandit lacus, ut placerat magna dui
eget erat. Proin condimentum auctor quam, nec congue nunc vestibulum quis. Vestibulum finibus erat
nulla, at luctus leo varius ac. Phasellus ac vehicula justo, sed lacinia ipsum. Vestibulum sed
orci in neque tempus fringilla at quis justo. Integer nec maximus nibh, in varius augue. Aliquam
quam ante, ultrices id ligula id, gravida sagittis augue. Phasellus id consequat ante. Fusce quis
risus a risus sodales dictum. Integer luctus interdum vestibulum. Quisque eleifend est sit amet
quam lobortis, ut molestie elit sagittis.

Quisque imperdiet mauris id arcu fringilla, at commodo sem pulvinar. Quisque auctor aliquet
facilisis. Cras vitae ornare mauris. Ut ornare orci nunc, ut ultricies turpis laoreet vel.
Curabitur dapibus, felis sit amet efficitur fringilla, odio odio blandit dui, vitae scelerisque
orci massa at arcu. Nam eleifend suscipit justo id dapibus. Fusce urna orci, hendrerit quis
tincidunt eu, fermentum ac neque. Nullam porttitor at lacus quis imperdiet. Curabitur fringilla
diam eu efficitur molestie. Nullam vitae eros suscipit, semper est sed, efficitur elit. Maecenas
congue dictum enim, quis lacinia orci ultrices ac. Phasellus interdum lectus mattis suscipit
ullamcorper. Integer venenatis velit libero, ut fringilla augue ullamcorper id. Nunc a elementum
leo, ultrices faucibus diam. Nam quis vestibulum sem.

Nam ullamcorper accumsan libero, nec eleifend dolor ullamcorper pretium. Vestibulum convallis vel
tortor quis mollis. Etiam molestie ante at malesuada tempor. Cras venenatis tincidunt purus quis
facilisis. Aliquam fringilla egestas venenatis. Morbi in tristique justo, et faucibus dolor.
Suspendisse bibendum arcu ut purus egestas, non facilisis dolor sollicitudin. Donec id iaculis
est, id imperdiet ipsum. Sed eget consectetur quam, sit amet tempor est. Phasellus vitae semper
risus, a mattis felis. Morbi sed ante convallis, tristique lacus vitae, imperdiet odio. Fusce
lacinia molestie ultricies. Duis at aliquet massa. Nunc varius a ligula non pharetra. Integer
posuere magna a urna hendrerit, vitae commodo elit tincidunt.

BLOCK

p count_letters2 statement

n = 5000
Benchmark.bm do |x|
  x.report do
    n.times do
      count_letters(statement)
    end
  end

  x.report do
    n.times do
      count_letters2(statement)
    end
  end

  x.report do
    n.times do
      count_letters3(statement)
    end
  end
end

# Looks like the "manual" loop and the each solutions are about equivalent in terms of performance.
# So the performance hit on the solution is probably due to making 52 iterations instead of 20, the
# length of the input string.
#        user     system      total        real
#    2.709981   0.008885   2.718866 (  2.753735)
#    2.743436   0.004951   2.748387 (  2.769387)
#    3.493200   0.003258   3.496458 (  3.503817)

# That suggests that longer passages might perform better with the solution, since he system
# hit is lower. Four paragraphs of "lorem ipsum" prove that to be the case, and signifiicantly so:
#        user     system      total        real
#   12.407578   0.031804  12.439382 ( 12.790426)
#   12.993549   0.058062  13.051611 ( 14.126328)
#    3.499168   0.008237   3.507405 (  3.563531)

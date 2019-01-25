# Print out all the vowels from the strings.
REQS =
  <<-BLOCK
  The wizard asked Alice (because she was sure to know), "Alice, by strings, did the Mad Hatter mean any form of strings,
  such as symbols, or perhaps just what the Ruby Witch calls Strings?"
  
  "I should think that he meant just Strings," said Alice. "He wouldn't want to upset the Ruby Witch, after all."
  
  "Ah, very true, very true," said the wizard absent-mindedly. "And, did he wish all of his vowels to appear on a single line, or one per line, or some other
  arrangement?" And, preoccupied by thoughts of the many rabbits he was chasing, he turned and began contemplating the pattern of the bricks in the wall.
  
  "Well, the Mad Hatter is mad," said Alice. "I expect that he should wish to do both at once. Oh, dear!"
  
  "Why, a compromise is just the thing," interrupted the caterpillar from his leaf, smoking his hookah contemplatively.
  
  "Oh, yes, a compromise!" Alice said excitedly, clapping her hands together. "Oh! How to do that?"
  
  "Well ... " said the caterpillar.
  
  "I know!" said Alice. Walking over to the wizard, and tugging his sleeve she said "If you please, sir?"
  
  "Eh?" said the wizard, startled from his cogitation. "If you please, sir, I think the Mad Hatter should like it if you were to output
  the vowels one word per line."
  
  "Capital!" said the wizard. "I shall do it immediately."
  BLOCK
REQS.freeze
# All right kids, recess is over.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

puts hsh.flatten.flatten.select { |e| e.is_a? String }.join(' ') # Now we're having fun.

hsh.each_value do |value|
  value.each do |value|
    value.chars.each do |c|
      print 'aeiou'.scan(c).join
    end
    print "\n"
  end
end
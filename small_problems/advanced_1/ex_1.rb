NOUNS = %w(cat dog lizard boy girl wombat).freeze
VERBS = %w(runs takes chases plays reads watches).freeze
ADJS = %w(sleepy tan lazy nervous green purple hot cold).freeze
ADVS = %w(lazily sleepily coldly warmly carefully).freeze
 
txt = File.read('plugin.txt')
while txt.include?('_noun_')
  txt.sub!('_noun_', NOUNS.sample)
end
while txt.include?('_verb_')
  txt.sub!('_verb_', VERBS.sample)
end
while txt.include?('_adj_')
  txt.sub!('_adj_', ADJS.sample)
end
while txt.include?('_adv_')
  txt.sub!('_adv_', ADVS.sample)
end

puts txt
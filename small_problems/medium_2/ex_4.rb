def compare_separators(str, the_chars)
  comparer = 0
  str.chars.each do |char|
    comparer += 1 if char == the_chars[0]
    comparer -= 1 if char == the_chars[1]
    return false if comparer < 0
  end
  comparer.zero? || the_chars[1].nil? && comparer.even?
end

def balanced?(str)
  ['{}', '[]', '()', '"', "'"].each do |the_chars|
    return false unless compare_separators(str, the_chars)
  end
  true
end

p balanced?('{{]]') == false
p balanced?('(()') == false
p balanced?("Boys' basketball")
p balanced?('{}}{') == false
p balanced?("''") == true
p balanced?("'''") == false
p balanced?('""') == true
p balanced?('"""') == false
p balanced?('[][]') == true
p balanced?('][][') == false
p balanced?('[({)]}') == true
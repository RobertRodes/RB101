def letter_percentages(str)
  downcase_pct = (str.count('a-z').to_f / str.size * 100).round(2)
  upcase_pct   = (str.count('A-Z').to_f / str.size * 100).round(2)
  neither_pct  = 100 - upcase_pct - downcase_pct
  
  { lowercase: downcase_pct, uppercase: upcase_pct, neither: neither_pct }
end

p letter_percentages('abcdefGHI')


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
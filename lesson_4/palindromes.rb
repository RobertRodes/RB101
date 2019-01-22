def get_palindromes(the_string)
  outer_counter = 0
  inner_counter = 2
  substrings = []
  while outer_counter < the_string.size - 1
    while inner_counter <= the_string.size - outer_counter
      subst = the_string.slice(outer_counter, inner_counter)
      substrings.push(subst) if subst.reverse == subst
      inner_counter += 1
    end
    inner_counter = 2
    outer_counter += 1
  end
  substrings
end

p get_palindromes 'Able was I ere I saw Elba'
p get_palindromes 'SATOR AREPO TENET OPERA ROTAS'

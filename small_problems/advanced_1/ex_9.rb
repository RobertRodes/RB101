def egyptianx(rational)
  denominators = []
  current_de = 1
  while Rational(1, current_de) != rational
    if Rational(1, current_de) < rational
      denominators << current_de
      rational -= Rational(1, current_de)
    end
    current_de += 1
  end 
   denominators << current_de
end

def egyptian(rational)
  dens = []
  counter = 0
  running_total = 0r
  while running_total < rational
	counter += 1
	if running_total + Rational(1, counter) <= rational
	  running_total += Rational(1, counter)
	  dens.push counter
	end
  end
  return dens
end

def unegyptian(ary)
  retval = 0r
  ary.each { |element| retval += Rational(1, element)}
  retval
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))  

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

def egyptian1(num, den)
  dens = []
  counter = 0
  running_total = 0.0
  quotient = (num.to_f / den.to_f).round(8)
  puts quotient
  while running_total.round(8) < quotient do
	counter += 1
	next if running_total + 1 / counter.to_f > quotient
	running_total += 1 / counter.to_f
	dens.push counter
  end
  return dens
end
  
  
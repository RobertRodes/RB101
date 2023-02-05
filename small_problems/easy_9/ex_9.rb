def get_grade(g1, g2, g3)
  avg = (g1 + g2 + g3) / 3.0
  if avg < 60
    'F'
  elsif avg < 70
    'D'
  elsif avg < 80
    'C'
  elsif avg < 90
    'B'
  else
    'A'
  end
end
  
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
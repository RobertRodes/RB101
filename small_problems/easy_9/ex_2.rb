def twice(num)
  if num.digits.size.even?
    d = num.digits
    s = d.size
    m = d.size / 2
    if d[0..m-1] == d[m..-1]
      return num
    end
  end
  num * 2
end

p twice(0) == 0
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
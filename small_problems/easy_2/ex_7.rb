counter = 2
while counter <= 98
  #puts counter
  counter += 2
end

require 'benchmark'

n = 5000
Benchmark.bm do |x|
  x.report('While 2  ') do
    n.times do
      counter = 2
      while counter <= 98
        dummy = counter
        counter += 2
      end
    end
  end

  x.report('Step     ') do
    n.times do
      2.step(98, 2) { |i| dummy = i }
    end
  end
  
  x.report('While 1  ') do
    n.times do
      counter = 2
      while counter <= 98
        dummy = counter if counter.even?
        counter += 1
      end
    end
  end

  x.report('Upto     ') do
    n.times do
      1.upto(99) { |num| dummy = num if num.even? }
    end
  end
  
  x.report('Each     ') do
    n.times do
      (1..99).each { |num| dummy = num if num.even? }
    end
  end
  
  x.report('Times    ') do
    n.times do
      98.times {|i| dummy = i + 1 if i.odd?}
    end
  end
      
  x.report('Select &:') do
    n.times do
      dummy = (1..99).select(&:even?)
    end
  end
  
  x.report('Select   ') do
    n.times do
      dummy = (1..99).to_a.select { |x| x.even? }
    end
  end
      
end


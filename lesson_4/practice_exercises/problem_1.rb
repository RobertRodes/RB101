require 'benchmark'

@flintstones = %w(Fred Barney Wilma Betty Pebbles BamBam)

def map_test
  flintstones_hash = {}
  @flintstones.map.with_index do |value, index|
    flintstones_hash[value.to_sym] = index
    flintstones_hash.store(value.to_sym, index)
  end
end

# p flintstones_hash
# p flintstones_hash2

def each_test
  flintstones_hash = {}
  @flintstones.each_with_index do |value, index|
    flintstones_hash[value.to_sym] = index
    flintstones_hash.store(value.to_sym, index)
  end
end

# p flintstones_hash
# p flintstones_hash2

def assign_test
  flintstones_hash = {}
  @flintstones.each_with_index do |value, index|
    flintstones_hash[value.to_sym] = index
  end
end

def store_test
  flintstones_hash = {}
  @flintstones.each_with_index do |value, index|
    flintstones_hash.store(value.to_sym, index)
  end
end

n = 500_000
Benchmark.bm do |x|
  # Map
  x.report do
    n.times do
      map_test
    end
  end

  # Each
  x.report do
    n.times do
      each_test
    end
  end

  # Each with assign
  x.report do
    n.times do
      assign_test
    end
  end

  # Each with store
  x.report do
    n.times do
      store_test
    end
  end
end

#       user     system      total        real
#   3.195777   0.003211   3.198988 (  3.218069)
#   2.426498   0.002253   2.428751 (  2.435477)
#   1.526415   0.001560   1.527975 (  1.533243)
#   1.605899   0.005453   1.611352 (  1.618124)

# Ok, so #each is quicker than #map, while assigning the value directly
# is a bit quicker than #store.

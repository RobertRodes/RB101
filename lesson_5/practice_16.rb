# method to return a new UUID.
# Bug fix on line 7: changed 65_536 to 65_535. Range should be
# from 0 to FFFF; 65_536 is hex value 10000.
# Analogous bug fix on line 17.

def uuid
  new_uuid = ''
  8.times do |i|
    hex_value = rand(65_535).to_s(16).rjust(4, '0')
    new_uuid << hex_value
    new_uuid << '-' if [2, 3, 4, 5].include? i
  end
  new_uuid
end

def uuid_part(size)
  rand(16**size - 1).to_s(16).rjust(size, '0')
end

def uuid2
  num = uuid_part(8) + '-'
  3.times { num << uuid_part(4) + '-' }
  num << uuid_part(12)
end

10.times { puts uuid }
puts
10.times { puts uuid2 }

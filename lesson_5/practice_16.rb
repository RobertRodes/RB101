# method to return a new UUID.

def uuid
  new_uuid = ''
  16.times do |i|
    hex_value = rand(256).to_s(16).rjust(2, '0')
    new_uuid << hex_value
    new_uuid << '-' if [3, 5, 7, 9].include? i
  end
  new_uuid
end

# Without looping, although rubocop doesn't like it. (ABC is too high.)
def uuid2
  rand(16**8).to_s(16).rjust(8, '0') + '-' +
    rand(16**4).to_s(16).rjust(4, '0') + '-' +
    rand(16**4).to_s(16).rjust(4, '0') + '-' +
    rand(16**4).to_s(16).rjust(4, '0') + '-' +
    rand(16**12).to_s(16).rjust(12, '0')
end

10.times { puts uuid }
puts
10.times { puts uuid2 }

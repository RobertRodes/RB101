NEW_LINE_COL = 78
NEW_LINE = "|\n| ".freeze

def print_line(endchar, middle, reps, pad = 0)
  print endchar
  reps.times { print middle }
  pad.times { print ' ' }
  print endchar + "\n"
end

def print_break(str)
  words = str.split
  print '| '
  col = 0

  while words.size > 0
    word = words.shift
    if col + word.size >= NEW_LINE_COL - 1
      until col == NEW_LINE_COL - 1
        print ' '
        col += 1
      end
      print NEW_LINE
      print word + ' '
      col = word.size + 1
    else
      print word
      print ' ' if col + word.size < NEW_LINE_COL
      col += word.size + 1
    end
  end

  (NEW_LINE_COL - col - 1).times { print ' ' }
  print '|'
end

def print_in_box(str)
  reps =
    if str.is_a? Array
      [str.max_by(&:length).length + 2, NEW_LINE_COL].min
    else
      [str.length + 2, NEW_LINE_COL].min
    end

  print_line('+', '-', reps)
  print_line('|', ' ', reps)

  if str.is_a? Array
    str.length.times do |i|
      if str[i].length > NEW_LINE_COL
        print_break(str[i])
      else
        print_line('|', ' ' + str[i] + ' ', 1, reps - str[i].length - 2)
      end
    end
  else
    if str.length > NEW_LINE_COL
      print_break(str)
    else
      print_line('|', ' ' + str + ' ', 1)
    end
  end

  print_line('|', ' ', reps)
  print_line('+', '-', reps)
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('In my end is my beginning.')
print_in_box(
  [
    'Yes, to dance beneath the diamond sky with one hand waving free',
    'Silhouetted by the sea, circled by the circus sands',
    'With all memory and fate driven deep beneath the waves',
    'Let me forget about today until tomorrow.'
  ]
)
print_in_box(
  [
    'Modify this method so it will truncate the message if it will be too wide ' \
    'to fit inside a standard terminal window (80 columns, including the sides ' \
    'of the box). For a real challenge, try word wrapping very long messages ' \
    'so they appear on multiple lines, but still within a box.',
    'Testing an array with a too long line ... this is a separate array element. ' \
    'No, it really is.'
  ]
)

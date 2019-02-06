def popit(stack)
  if stack.empty?
    puts 'Error 8080: attempted to POP from empty stack.'
    exit
  else
    stack.pop
  end
end

def token_error(cmd)
  puts "Error 8088: token #{cmd} not found in instruction set."
  exit
end

def minilang(cmds)
  reg = 0
  stack = []
  cmds.split.each do |cmd|
    case cmd
    when 'PUSH'  then stack.push(reg)
    when 'ADD'   then reg += popit(stack)
    when 'SUB'   then reg -= popit(stack)
    when 'MULT'  then reg *= popit(stack)
    when 'DIV'   then reg /= popit(stack)
    when 'MOD'   then reg %= popit(stack)
    when 'POP'   then reg = popit(stack)
    when 'PRINT' then puts reg
    else
      if cmd.match?(/[0-9]/)
        reg = cmd.to_i
      else
        token_error(cmd)
      end
    end
  end
end

# (3 + (4 * 5) - 7) / (5 % 3)
minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT ')
#minilang('POP')
minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH PUNT 5 MULT PUSH 3 ADD SUB DIV PRINT ')
exit
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
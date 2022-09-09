require './choice'

def main
  choice = Choice.new
  loop do
    choice.display_list
    option = gets.chomp.to_i
    case option
    when 1..6
      choice.dispatch(option)
    else
      break
    end
  end
  choice.on_exit
end
main

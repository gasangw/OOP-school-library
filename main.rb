require './app'

class Main < App
  def run
    puts 'Your most welcome to OOP School Library'
    loop do
      list
      option = gets.chomp
      break if option == '6'

      get_num option
    end
    puts 'Thanks for visiting our library'
  end

  def list
    puts
    puts 'Kindly select an option by entering a number'
    puts '0 - List all books'
    puts '1 - List all people'
    puts '2 - Create a person'
    puts '3 - Create a book'
    puts '4 - Create a rental'
    puts '5 - List all rentals for a given person id'
    puts '6 - Exit'
  end
end

Main.new.run

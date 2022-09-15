require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'prosessor'

class App
  include Prosessor
  def initialize
    @books = read_books_from_file || []
    @people = read_people_from_file || []
    @rentals= []
   # @rentals = read_rentals_from_file || []
  end

  def list_all_books
    read_books_from_file
    if @books.empty?
      puts 'There is no book!'
    else
      @books.each { |book| puts "Title: '#{book["title"]}', Author: #{book["author"]}" }
    end
  end

  def list_all_people
    read_people_from_file
    if @people.empty?
      puts 'there is no person'
    else
      @people.each { |person| puts "[#{person["classname"]}] Name: #{person["name"]}, ID: #{person["id"]}, Age: #{person["age"]}" }
    end
  end

  def create_person
    puts 'do you want to create a student(1) or a teacher (2):'
    selected_person = gets.chomp.to_i
    print 'age:'
    age = gets.chomp.to_i
    print 'name:'
    name = gets.chomp.to_s
    case selected_person
    when 1
      print 'Has parent permission? [Y/N]: '
    
      provided_permission = gets.chomp.capitalize
      student_permission = true if provided_permission == 'Y'
      student_permission = false if provided_permission == 'N'
      @people.push(Student.new(age, student_permission, name))

    when 2
      print 'Specialization: '
      specialization = gets.chomp.to_s
      @people.push(Teacher.new(specialization, age, name))
    end
    puts 'Person created successfully.'
    people_to_file
  end

  def create_book
    print 'title:'
    title = gets.chomp
    print 'author:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'the book is created successfully'
    books_to_file
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.map.with_index { |book, index| puts "#{index}) Title: '#{book['title']}', Author: #{book['author']}" }
    selected_book = gets.chomp.to_i

    puts 'Select a person from the following list by number (Not ID): '
    @people.map.with_index do |person, index|
      puts "#{index}) [#{person['classname']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end

    selected_person = gets.chomp.to_i
    print 'date:'
    provided_date = gets.chomp
    @rentals.push(Rental.new(provided_date, @books[selected_book], @people[selected_person]))
    rentals_to_file
    puts ' rental created succesfully'
  end

  def list_all_rentals_by_id
    print 'ID of person: '
    person_id = gets.chomp.to_i
    (@rentals.select { |rental| rental.person.id == person_id }).each do |rental|
      puts "Date: #{rental['date']}, Book: #{rental['book']['title']} by #{rental['book']['author']}"
    end
  end
end

require './classroom'
require './book'
require './student'
require './teacher'

class App
    attr_reader :books, :classrooms, :students, :teachers

    def initialize
        @students = []
        @books = []
        @classrooms = []
        @rentals = []
        @teachers = []
    end

    def list_books(books)
        @books.each { |b| puts "[Book] Title: #{b.title}, Author: #{b.author}"}
    end

    def list_classroom
        @classrooms.each { |c| puts "[Classroom] Label: #{c.label}"}
    end

    def list_people
        @students.each { |s| puts "[Student] ID: #{s.id}, Name: #{s.name}"}
        @teachers.each { |t| puts "[Teacher] ID: #{t.id}, Name: #{t.name}"}
    end  
    
    def create_student(age, name, classroom)
        student = Student.new(age, name, classroom)
        @student << student
        student
    end

    def create_teacher(age, name, specialization)
        teacher = Teacher.new(age, name, specialization)
        @teacher << teacher 
        teacher 
    end

    def create_book(title, author)
        book = Book.new(title, author)
        @book << book 
        book 
    end

    def create_rental(person, book)
        rental = Rental.new(person:person, book:book)
        @rentals << rental 
        rental 
    end

    def rentals_by_person(person_id)
        (@rentals.select { |r| r.person_id = person_id}).each do |d| puts "[Rental] Date: #{d.date}, Title: #{d.book.title}, Borrower: #{d.person.name}"
        end
    end
end
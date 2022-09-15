require 'json'

module Prosessor

    # creates object in format key:value for every particular book from books array
    # saves this data in book.json file

    def books_to_file
        book_obj = @books.map do |book|
            { title: book.title, author: book.author, rentals: book.rentals }
         end
         File.write('./library/books.json', book_obj.to_json)
        end

    # parse data from JSON file

    def read_books_from_file
        file = File.read('./library/books.json')
        read_books = JSON.parse(file)
    rescue StandardError
        print 'no books was saved'
    end   

    # create two arrays for student and teacher
    # conditionally map all students and teachers to separate arrays
    # concatinate arrays and write to JSON file

    def people_to_file

        students_obj = @people.filter_map do |person|
            { classname: person.class.name,
            name: person.name,
            id: person.id,
            age: person.age,
            parent_permission: person.parent_permission,
            rentals: person.rentals
        } if person.class.name === 'Student'
        end

        teachers_obj = @people.filter_map do |person|
            { classname: person.class.name,
                specialization: person.specialization,
                name: person.name,
                id: person.id,
                age: person.age,
                rentals: person.rentals
            } if person.class.name === 'Teacher'
        end

        people_obj = students_obj.concat teachers_obj
        File.write('./library/people.json', people_obj.to_json)
    end

    # parse people data from JSON file
    
    def read_people_from_file
        file = File.read('./library/people.json')
        read_people = JSON.parse(file)
    rescue StandardError
        print 'no people was saved'
    end  

    def rentals_to_file

        rentals_obj = @rentals.map do |rental|
            { date: rental.date, 
                book: {title: rental.book.title, author: rental.book.author}, 
                person: {name: rental.person.name, age: rental.person.age, id: rental.person.id}
            }
            end
        File.write('./library/rentals.json', rentals_obj.to_json)
        puts rentals_obj
    end

    def read_rentals_from_file
        file = File.read('./library/rentals.json')
        read_rentals = JSON.parse(file)
        puts read_rentals
    rescue StandardError
        print 'no rentals was saved'
    end

    # restore objects 

    def restore_books(items)
        items.each do |item|
            book = Book.new(
            title: book['title'],
            author: book['author'],
            rentals: book['rentals']
        )
        end
    end
end





=begin

def restore_rentals(rentals)
    rentals.each do |rental|
        date: rental['date'],

       
end

@title = title
@author = author
@rentals = []

def from_json_to_actual_class_objects(items)
    items.each do |item|
      book = Book.new(
        id: item['id'],
        cover_state: item['cover_state'],
        publisher: item['publisher'],
        archived: item['archived'],
        publish_date: Date.parse(item['publish_date'])
      )
      restore_relationship(book, item)
    end
  end
=end
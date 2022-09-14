require 'json'

module Prosessor

    # creates object in format key:value for every particular book from books array
    # saves this data in book.json file

    def books_to_file
        book_obj = @books.map do |book|
            { title: book.title, author: book.author }
         end
         File.write('./library/books.json', book_obj.to_json)
        end

    # parse data from JSON file

    def read_books_from_file
        file = File.read('./library/books.json')
        read_books = JSON.parse(file)
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
            parent_permission: person.parent_permission
        } if person.class.name === 'Student'
        end

        teachers_obj = @people.filter_map do |person|
            { classname: person.class.name,
                specialization: person.specialization,
                name: person.name,
                id: person.id,
                age: person.age 
            } if person.class.name === 'Teacher'
        end

        people_obj = students_obj.concat teachers_obj
        puts people_obj
        File.write('./library/people.json', people_obj.to_json)
    end

    # parse people data from JSON file
    
    def read_people_from_file
        file = File.read('./library/people.json')
        read_people = JSON.parse(file)
    end  

    def rentals_to_file
        rentals_obj = @rentals.map do |rental|
        { date: rental.date, book: rental.book, person: rental.person }
        end
        File.write('./library/books.json', rentals_obj.to_json)
    end
=begin
    def red_rentals_from_file
        file = File.read('./library/rentals.json')
        read_rentals = JSON.parse(file)
    end
=end

end
require 'json'

module Prosessor

    # creates object in format key:value for every particular book from books array
    # saves this data in book.json file

    def books_to_file

    def books_to_file
        book_obj = @books.map do |book|
            { title: book.title, author: book.author }
         end
         File.write('./library/books.json', book_obj.to_json)
        end
    end

    def read_books_from_file
        file = File.read('./library/books.json')
        read_books = JSON.parse(file)
    end   

    def people_to_file
        people_obj = @people.map do |person| (person.class === 'Student' ?
            { class: person.class, name: person.name, id: person.id, age: person.age, parent_permission: person.parent_permission }
            : { class: person.class, specialization: person.specialization, name: person.name, id: person.id, age: person.age })
        end
        puts people_obj
        File.write('./library/people.json', people_obj.to_json)
    end
    
    def read_people_from_file
        file = File.read('./library/people.json')
        read_people = JSON.parse(file)
    end  
end

=begin
       students_obj = @people.filter_map do |person| 
            { age: person.age, parent_permission: person.parent_permission, name: person.name }
            if person.is_a? Student
        end
=end
    

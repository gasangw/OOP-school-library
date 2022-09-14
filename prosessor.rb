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


end

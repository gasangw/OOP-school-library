require 'json'

module Prosessor
    def books_to_file
        def books_to_file
            book_obj = @books.map do |book|
              { title: book.title, author: book.author }
            end
            File.write('./library/books.json', book_obj.to_json)
          end
    end
end

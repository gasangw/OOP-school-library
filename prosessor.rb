require 'json'

module Prosessor
    def books_to_file
   
   book_obj = @books.map do |book| 
    { :title => book.title, :author => book.author } 
   end
   JSON.dump(File.write('./library/books.json', book_obj))
   
   # json = JSON.generate({@books['title'], books['name']})
   # File.open('./library/books.json', 'w')
    end
end
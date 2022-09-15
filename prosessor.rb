require 'json'

module Prosessor
  # books functuanality

  def books_to_file(books)
    book_obj = books.map do |book|
      { title: book.title, author: book.author }
    end
    File.write('./library/books.json', book_obj.to_json)
  end

  # parse data from JSON file

  def read_books_from_file(books)
    file = File.read('./library/books.json')
    read_books = JSON.parse(file)
    puts read_books

    read_books.each do |book|
      books << Book.new(book['title'], book['author'])
    end
  rescue StandardError
    print 'no books was saved'
  end

  # handle people database

  def read_people_from_file(people)
    file = File.read('./library/people.json')
    read_people = JSON.parse(file)

    read_people.each do |person, _i|
      if person['classname'] == 'Student'

        temp = Student.new(person['age'], person['parent_permission'], person['name'])
        temp.id = person['id']
        people << temp # rubocop:disable Style/IdenticalConditionalBranches

      else

        temp = Teacher.new(person['specialization'], person['age'], person['name'])
        temp.id = person['id']
        people << temp # rubocop:disable Style/IdenticalConditionalBranches

      end
    end
  rescue StandardError
    print 'no people was saved'
  end

  def people_to_file(people)
    students_obj = people.filter_map do |person|
      if person.instance_of?(::Student)
        { classname: person.class.name,
          name: person.name,
          id: person.id,
          age: person.age,
          parent_permission: person.parent_permission }
      end
    end

    teachers_obj = people.filter_map do |person|
      if person.instance_of?(::Teacher)
        { classname: person.class.name,
          specialization: person.specialization,
          name: person.name,
          id: person.id,
          age: person.age }
      end
    end

    people_obj = students_obj.concat teachers_obj
    File.write('./library/people.json', people_obj.to_json)
  end

  # handle rentals

  def rentals_to_file(rentals = [])
    rentals_obj = rentals.map do |rental|
      { date: rental.date,
        book: rental.book,
        person: rental.person }
    end
    File.write('./library/rentals.json', rentals_obj.to_json)
  end

  def read_rentals_from_file(rentals, books, people)
    file = File.read('./library/rentals.json')
    read_rentals = JSON.parse(file)
    read_rentals.each do |rental|
      book = books.find { |b| b.title == rental['book']['title'] }
      person = people.find { |p| p.id = rental['person']['id'] }
      rentals << person.add_rental(rental['date'], book)
    end
  rescue StandardError
    print 'no rentals was saved'
  end

  # app status methods

  def save_state(app)
    books_to_file(app.books)
    people_to_file(app.people)
    rentals_to_file(app.rentals)
  end

  def load_state(app)
    read_books_from_file(app.books)
    read_people_from_file(app.people)
    read_rentals_from_file(app.rentals, app.books, app.people)
  end
end

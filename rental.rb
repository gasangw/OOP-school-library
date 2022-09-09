class Rental
  attr_accessor :date, :person, :book

  def initialize(person:, book:)
    @date = DateTime.now.strftime('%Y/%m/%d %H:%m')

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end

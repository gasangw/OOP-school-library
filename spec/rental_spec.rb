require_relative './spec_helper'

describe Rental do
  before(:each) do
    @person = Person.new(22, 'Josh')
    @book = Book.new('Intimacy', 'Analise')
  end

  context 'when testing the rental class' do
    it 'Create rental with both person & book' do
      rental = Rental.new('2022/08/31', @book, @person)
      expect(rental.book).to be(@book)
      expect(@book.rentals.first).to be(rental)
      expect(rental.person).to be(@person)
      expect(@person.rentals.first).to be(rental)
    end
  end
end

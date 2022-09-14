require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('title', 'author')
    @person = Person.new(24)
  end

  context 'creating a book' do
    it 'should create an instance of the book' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should return title and author' do
      expect @book.title.should eq 'title'
      expect @book.author.should eq 'author'
    end

    it 'book has rental' do
      @book.add_rental(@person, '02/02/2020')
      expect(@book.rentals).not_to be_empty
    end
  end
end

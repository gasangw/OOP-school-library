require_relative 'spec-helper'

describe Book do
  before :each do
    @book = Book.new('title', 'author')
  end

  context 'creating a book' do
    it "should create an instance of the book" do 
       expect(@book).to be_an_instance_of Book
    end

    it 'should return title and author' do
      expect (@book.title).should eq 'title'
      expect (@book.author).should eq 'author'
    end
 end
end

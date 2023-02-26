require 'rspec'
require './lib/book'

RSpec.describe do 
  before(:each) do
    @book = Book.new({
      author_first_name: "Harper", 
      author_last_name: "Lee", 
      title: "To Kill a Mockingbird", 
      publication_date: "July 11, 1960"})
  end
  describe '#initialize' do
    it 'exists & has attributes' do
      expect(@book).to be_a(Book)
      expect(@book.title).to eq("To Kill a Mockingbird")
    end
  end
  
  describe '#methods' do
    it 'compiles author full name from first and last' do
      expect(@book.author).to eq("Harper Lee")
    end

    it 'returns publication year from publication date' do
      expect(@book.publication_year).to eq("1960")
    end
  end
end

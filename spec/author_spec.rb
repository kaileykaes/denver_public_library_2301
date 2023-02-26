require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe do 
  before(:each) do 
    @charlotte_bronte = Author.new({
      first_name: "Charlotte", 
      last_name: "Bronte"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_a(Author)
    end

    it 'returns a name' do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'can write books' do 
      expect(@charlotte_bronte.books).to eq([])

      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(@charlotte_bronte.books).to all(be_a Book)
      expect(jane_eyre.title).to eq("Jane Eyre")

      villette = @charlotte_bronte.write("Villette", "1853")
      expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
      expect(@charlotte_bronte.books).to all(be_a Book)
    end

  end
end
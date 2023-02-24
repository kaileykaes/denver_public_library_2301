require 'rspec'
require './lib/author'

RSpec.describe do 
  describe '#initialize' do
    it 'exists' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte).to be_a(Author)
    end

    it 'returns a name' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end
  end
end
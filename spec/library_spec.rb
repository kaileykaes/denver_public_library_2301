require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe do
  before(:each) do
    @library = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
  end

  it 'exists & has attributes' do
    expect(@library).to be_a(Library)
    expect(@library.name).to eq("Denver Public Library")
  end

  it 'stores books' do 
    expect(@library.books).to eq([])
  end

  it 'knows authors' do
    expect(@library.authors).to eq([])
  end

  it 'can add authors' do
    expect(@library.add_author(@charlotte_bronte)).to eq([@charlotte_bronte])
    expect(@library.books).to eq([@jane_eyre, @villette])
  end

  it 'tells publication time frame for authors' do 
    expected = {
      start: @jane_eyre.publication_year, 
      end: @villette.publication_year
    }
    expect(@library.publication_time_frame_for(@charlotte_bronte)).to eq(expected)
  end

  it 'can check out a book & list checked out books' do 
    expect(@library.checked_out(@villette)).to eq([@villette])
    expect(@library.checked_out(@jane_eyre)).to eq([@villette, @jane_eyre])
  end
  
  it 'can return a book' do 
    @library.checked_out(@villette)
    @library.checked_out(@jane_eyre)
    @library.return_book(@jane_eyre)
    expect(@library.checked).to eq([@villette])
  end

  it 'can find most check out book' do
    @library.checked_out(@villette)
    @library.return_book(@villette)
    @library.checked_out(@villette)
    @library.return_book(@villette)
    @library.checked_out(@villette)
    @library.return_book(@villette)
    @library.checked_out(@villette)
    @library.checked_out(@jane_eyre)
    @library.return_book(@jane_eyre)
    @library.checked_out(@jane_eyre)
    @library.return_book(@jane_eyre)
    expect(@library.popular_book).to eq(@villette)
  end
end
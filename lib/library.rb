class Library
  attr_reader :name,
              :books, 
              :authors, 
              :checked, 
              :book_log

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked = []
    @book_log = Hash.new(0)
  end

  def add_author(author)
    @books << author.books
    @books.flatten!
    @authors << author
  end

  def publication_time_frame_for(author)
    dates = author.books.map { |book| book.publication_year } 
    { start: dates.min, end: dates.max }
  end

  def checked_out(book)
    @book_log[book] += 1
    @checked << book unless @checked.include?(book)
  end

  def return_book(book)
    @checked.each_with_index do |bk, index|
      @checked.delete_at(index) if bk == book 
    end
  end

  def popular_book
    @book_log.map do |bk, count|
      bk if count == @book_log.values.max
    end.compact[0]
  end
end

class Author
    attr_reader :author_details, 
                :first_name, 
                :last_name, 
                :books

  def initialize(author_details)
    @first_name     = author_details[:first_name]
    @last_name      = author_details[:last_name]
    @author_details = author_details
    @books          = []
  end

  def name
    @first_name + (" ") + @last_name
  end

  def write(title, publication_date)
    book = Book.new({
      author_first_name: @first_name, 
      author_last_name: @last_name, 
      title: title, 
      publication_date: publication_date
      })
    @books << book 
    book
  end
end

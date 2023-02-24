class Author
    attr_reader :author_details, :first_name, :last_name

  def initialize(author_details)
    @first_name = author_details[:first_name]
    @last_name = author_details[:last_name]
    @author_details = author_details
  end

  def name
    names = [] 
    names << @first_name
    names << @last_name
    names.join(" ")
  end
end

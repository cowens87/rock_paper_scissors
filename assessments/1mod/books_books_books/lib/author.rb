class Author
  attr_reader :name,
              :books

  def initialize(attributes)
    @name   = attributes[:first_name] + ' ' + attributes[:last_name]
    @books  = []
  end

  def write(title, date)
    book = Book.new({
                    author_first_name: @name.split(' ')[0],
                    author_last_name: @name.split(' ')[1],
                    title: title,
                    publication_date: date
                    })
    @books << book
    book
  end
end

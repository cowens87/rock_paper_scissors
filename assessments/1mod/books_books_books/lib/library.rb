class Library
  attr_reader :name,
              :authors,
              :checked_out_books,
              :book_popularity

  def initialize(name)
    @name              = name
    @authors           = []
    @checked_out_books = []
    @book_popularity   = Hash.new(0)
  end

  def add_author(author)
    @authors << author
  end

  def books
    @authors.flat_map(&:books)
  end

  def years(author)
    author.books.flat_map(&:publication_year)
  end

  def publication_time_frame_for(author)
    { start: years(author).min, end: years(author).max }
  end

  def book_available?(book)
    @authors.each { |author| return true if author.books.include?(book) }
  end

  def checkout(book)
   if !@authors.empty? && book_available?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book 
      @book_popularity[book] += 1
      true
   else
      false
   end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @book_popularity.key(@book_popularity.values.max)
  end
end

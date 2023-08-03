class Rental
  attr_accessor :date, :book

  def initialize(date, book)
    @date = date
    @book = book
  end

  def add_book(book)
    @book = book
    book.rentals << self unless book.rentals.includes?(self)
  end
end
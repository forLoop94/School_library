class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def add_book(book)
    @book = book
    book.rentals << self unless book.rentals.includes?(self)
  end

  def add_person(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end
end
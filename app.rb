require_relative 'book'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_books
    if @books.empty?
      puts "No books available"
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      "No persons available"
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def list_rentals_by_person_id
    puts "ID of person: "
    id = gets.chomp.to_i
    target_person = @people.find { |person| person.id == id }
    if target_person.nil
      puts "No person available"
    else
      puts "Rentals"
      puts "The given person doesn't rent any book" if person.rentals.empty?
      person.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
    end
  end
end

app = App.new()
app.list_books
app.list_rentals_by_person_id
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
end

app = App.new()
app.list_books
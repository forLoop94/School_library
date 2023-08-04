require_relative 'book'
require_relative 'student'
require_relative 'teacher'

class App
  attr_reader :people

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

  def create_person
    print "To create a student, press 1: "
    chosen_num = gets.chomp.to_i
    if chosen_num == 1
      student_creator
    else
      puts "All you can create now is a student"
    end
  end

  def student_creator
    print "Enter student name: "
    name = gets.chomp.to_s
    print "Enter class: "
    classname = gets.chomp.to_s
    print "Enter student age: "
    age = gets.chomp.to_i
    @people << Student.new(age, classname, name)
    puts "Student registered succesfully"
  end
end

app = App.new()
# app.create_person
puts app.list_people
puts app.people.each { |person| puts person }
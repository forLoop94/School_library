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
    print "D you want to create a student (1) or a teacher (2)? [input the number]: "
    chosen_num = gets.chomp.to_i
    case chosen_num
    when 1
      student_creator
    when 2
      teacher_creator
    end
  end

  def student_creator
    print "Name: "
    name = gets.chomp.to_s
    # print "Enter class: "
    # classname = gets.chomp.to_s
    print "Age: "
    age = gets.chomp.to_i
    print "Has parent permission? [Y/N]: "
    permission = gets.chomp.downcase
    parent_permission = true
    case permission
    when 'n'
      parent_permission = false
    when 'y'
      parent_permission = true
    end

    @people << Student.new(age, nil, name, parent_permission: parent_permission)
    puts "You have successfully registered a student"
  end
end

app = App.new()
# app.create_person
puts app.list_people
puts app.people.each { |person| puts person }
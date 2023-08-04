require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_books
    puts 'No books available' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts
  end

  def list_people
    puts 'No persons available' if @people.empty?

    @people.each do |person|
      puts "[#{person.class}] Name:
    #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts
  end

  def list_rentals_by_person_id
    puts 'ID of person: '
    id = gets.chomp.to_i
    target_person = @people.find { |person| person.id == id }
    if target_person.nil?
      puts 'No person available'
    else
      puts 'Rentals'
      puts 'The given person did not rent any book' if target_person.rentals.empty?
      target_person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def create_person
    print 'D you want to create a student (1) or a teacher (2)? [input the number]: '
    chosen_num = gets.chomp.to_i
    case chosen_num
    when 1
      student_creator
    when 2
      teacher_creator
    end
  end

  def student_creator
    print 'Name: '
    name = gets.chomp.to_s
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase
    parent_permission = true
    case permission
    when 'n'
      parent_permission = false
    when 'y'
      parent_permission = true
    end

    @people << Student.new(age, nil, name, parent_permission: parent_permission)
    puts 'You have successfully registered a student'
  end

  def teacher_creator
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'specialization: '
    specialization = gets.chomp
    parent_permission = true
    @people << Teacher.new(age, specialization, name, parent_permission: parent_permission)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    puts 'Book created successfully'
    @books << Book.new(title, author)
  end

  def create_rental
    print 'Select book of your choice by number: '
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_number = gets.chomp.to_i

    print 'Select person of your choice by number: '
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    person_number = gets.chomp.to_i

    date = get_user_date('Enter date [YYYY-MM-DD]: ').to_s

    if valid_entries?(book_number, person_number)
      Rental.new(date, @books[book_number], @people[person_number])
      puts 'Rental created successfully'
    else
      puts 'Invalid person or book selected'
    end
  end

  def get_user_date(request)
    puts request
    gets.chomp
  end

  def valid_entries?(book_number, person_number)
    person_number >= 0 && person_number < @people.length && book_number >= 0 && book_number < @books.length
  end
end

app = App.new
app.create_book
app.list_books
app.create_person
app.list_people
app.create_rental
app.list_rentals_by_person_id

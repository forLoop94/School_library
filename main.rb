require_relative 'app'

class Main
  def initialize
    @app = App.new
    run
  end

  def display_menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def user_option
    gets.chomp
  end

  def choose_option(option)
    actions = {
      '1' => -> { @app.list_books },
      '2' => -> { @app.list_people },
      '3' => -> { @app.create_person },
      '4' => -> { @app.create_book },
      '5' => -> { @app.create_rental },
      '6' => -> { @app.list_rentals_by_person_id },
      '7' => lambda {
               puts 'Exiting...'
               @running = false
             },
      'default' => -> { puts 'Invalid value!' }
    }

    action = actions[option] || actions['default']
    action.call
  end

  def run
    puts 'Welcome to the school library App!'
    @running = true

    while @running
      display_menu
      selected_option = user_option
      choose_option(selected_option)
    end
  end
end

Main.new
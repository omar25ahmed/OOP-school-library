require './app'

class Main
  def initialize
    @app = App.new
  end

  def pick_option(operation)
    case operation
    when '1'
      @app.list_books
    when '2'
      @app.list_persons
    when '3'
      @app.create_person
    when '4'
      @app.create_book
    when '5'
      @app.create_rental
    when '6'
      @app.list_rentals
    end
    print_options
  end

  def print_options
    puts ''
    puts 'WELCOME TO SCHOOL LIBRARY APP!'
    puts ''
    puts 'Please choose an operation from the following options'
    puts '1  →  List all books'
    puts '2  →  List all people'
    puts '3  →  Create a person'
    puts '4  →  Create a book'
    puts '5  →  Create a rental'
    puts '6  →  List all rentals for a given person id'
    puts '7  →  Exit'
    operation = gets.chomp
    exit if operation == '7'

    pick_option(operation)
  end

  def run
    option = print_options
    pick_option(option)
  end
end

new_main = Main.new
new_main.run

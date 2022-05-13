require './person.rb'
require './student.rb'
require './teacher.rb'
require './nameable.rb'
require './book.rb'
require './rental.rb'
require './classroom'

class App
  attr_reader :books, :persons, :rentals
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts "No books found"
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    end
  end

  def list_persons
    if @persons.empty?
      puts "No Persons Found"
    else
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person.class}], Name: #{person.name} ID: #{person.id}, Age: #{person.age} "
      end
    end
  end

  def create_person
    puts "Do you want to create a student (1) or a teacher (2)? [input the number]"
    selected_person = gets.chomp
    if selected_person == '1'
      puts "Age: "
      age = gets.chomp
      puts "Name: "
      name = gets.chomp
      puts "Has parent permission [Y/N]: "
      parent_permission = gets.chomp
      puts "Classroom: "
      classroom = gets.chomp
      @persons << Student.new(age, name, parent_permission, classroom)
      puts "Person Created succesfully"
    elsif selected_person == '2'
      puts "Age: "
      age = gets.chomp
      puts "Name: "
      name = gets.chomp
      puts "Specialization: "
      specialization = gets.chomp
      @persons << Teacher.new(age, name, specialization)
      puts "Person Created succesfully"
    else
      puts "Invalid selection"
    end
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created succesfully"
  end

  def create_rental
    puts 'Select a person from the following list by serial number'
    list_books
    selected_book = @books[gets.chomp.to_i]
    list_persons
    selected_person = @persons[gets.chomp.to_i]
    print 'Date: '
    date = gets.chomp
    @rentals << selected_person.add_rental(date, selected_book)
    puts "Rental created succesfully"
  end

  def list_rentals
    print 'Id of person: '
    id = gets.chomp.to_i
    person_details = @persons.find { |person| person.id == id }
    if person_details
      puts 'Rentals:'
      person_details.rental.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    else
      puts "No Rentals Found"
    end
  end

  def pick_option(operation)
    case operation
    when '1'
      list_books
    when '2'
      list_persons
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
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
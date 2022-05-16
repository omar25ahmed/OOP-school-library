require './person'
require './student'
require './teacher'
require './nameable'
require './book'
require './rental'
require './classroom'
require './create_person'

class App
  include CreatePerson
  attr_reader :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_persons
    if @persons.empty?
      puts 'No Persons Found'
    else
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person.class}], Name: #{person.name} ID: #{person.id}, Age: #{person.age} "
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created succesfully'
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
    puts 'Rental created succesfully'
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
      puts 'No Rentals Found'
    end
  end


end

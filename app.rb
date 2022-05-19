require './person'
require './student'
require './teacher'
require './nameable'
require './book'
require './rental'
require './classroom'
require './create_person'
require 'json'
require 'byebug'

class App
  include CreatePerson
  attr_reader :books, :persons, :rentals

  def initialize
    @books = load_json('books.json').map { |b| Book.new(b['title'], b['author']) }
    @persons = load_json('people.json').map do |person|
      if person['type'] == 'Student'
        Student.new(person['age'], person['id'], person['name'], person['parent_permission'])
      else
        Teacher.new(person['age'], person['id'], person['name'], person['specialization'])
      end
    end
    @rentals = load_json('rentals.json')
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

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index do |book, index|
        book = book.is_a?(Book) ? book : Book.new(book['title'], book['author'])
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    json = File.read('books.json')
    books = File.zero?('books.json') ? [] : JSON.parse(json)

    book = Book.new(title, author)
    books << book.attrs

    File.write('books.json', JSON.pretty_generate(books))

    @books << book
    puts 'Book created succesfully'
  end

  def create_rental
    puts 'Select a person from the following list by index number'
    list_books
    marked_book = @books[gets.chomp.to_i]
    list_persons
    marked_person = @persons[gets.chomp.to_i]
    print 'Date: '
    date = gets.chomp
    json = File.read('rentals.json')
    rentals = File.zero?('rentals.json') ? [] : JSON.parse(json)
    rental = { 'date' => date, 'person' => marked_person.attrs, 'book' => marked_book.attrs }
    rentals << rental
    @rentals << rental

    File.write('rentals.json', JSON.pretty_generate(rentals))
    puts 'Rental created succesfully'
  end

  def list_rentals
    print 'Id of person: '
    id = gets.chomp.to_i
    rentings = @rentals.select { |r| r['person']['id'].to_i == id }
    if rentings.empty?
      puts 'No Rentals Found'
    else
      puts 'Rentals:'
      rentings.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental['date']}, Book: #{rental['book']['title']} by #{rental['book']['author']}"
      end
    end
  end

  def load_json(path)
    return [] unless File.exist?(path)
    return [] if File.zero?(path)

    read_path = File.read(path)
    JSON.parse(read_path, create_additions: true)
  end
end

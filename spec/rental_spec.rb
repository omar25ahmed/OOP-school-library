require './rental'
require './book.rb'
require './person'

describe Rental do
  before(:each) do
    @book = Book.new('Harry Poter', 'John Doe')
    @person = Person.new(18, 25, 'mo')
    @rental = Rental.new('2022/8/9', @person, @book)
  end

  it 'should not be equal date that entered' do
    expect(@rental.date).not_to eq('2022/8/12')
  end

  it 'should have person' do
    expect(@rental.person).to eq(@person)
  end

  it 'should have a book' do
    expect(@rental.book).to eq(@book)
  end
end
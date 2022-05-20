require './teacher'

describe Person do
  before(:each) do
    @person = Person.new(25, 2, 'John')
  end

  it 'should use services' do
    expect(@person.can_use_services?).to be true
  end

  it 'should give us the type of the class' do
    expect(@person.type).to eq('Person')
  end

  it 'should check rentals' do
    expect(@person.rental.length).to eq(0)
  end
end

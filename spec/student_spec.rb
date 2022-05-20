require './student'

describe Student do
  before(:each) do
    @student = Student.new(19, 1, 'John', parent_permission: true)
  end

  it 'should have a name' do
    expect(@student.name).to eq('John')
  end

  it 'should have an age' do
    expect(@student.age).to eq(19)
  end

  it 'should have an id' do
    expect(@student.id).to eq(1)
  end

  it 'should have a play_hooky method' do
    expect(@student.play_hooky).to eq("¯\(ツ)/¯")
  end
end

require './teacher.rb'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(40, 2, 'John', 'Coding')
  end

  it 'should use service' do
  expect(@teacher.can_use_services?).to be true
  end

  it 'should be instance' do
    expect(@teacher) .to be_an_instance_of(Teacher)
  end
end
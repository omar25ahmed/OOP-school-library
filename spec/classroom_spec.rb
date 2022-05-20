require './classroom'
require './student'

describe CreateClass do
    before(:each) do
        @classroom = CreateClass.new("Math")
        # @student = Student.new(19, 1, "John", parent_permission: true)
        
    end

    it 'should have a label' do
        expect(@classroom.label).to eq("Math")
    end

    it 'should have an instance' do
        expect(@classroom).to be_an_instance_of(CreateClass)
    end
end

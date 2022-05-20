require './base_decorator'

describe BaseDecorator do
    before(:each) do
        @nameable = Nameable.new
        @base_decorator = BaseDecorator.new(@nameable)
    end
    
    it 'should have a nameable' do
        expect(@base_decorator.nameable).to eq(@nameable)
    end
    
    it 'should have a correct_name method' do
        expect(@base_decorator).to respond_to(:correct_name)
    end
end
    
  

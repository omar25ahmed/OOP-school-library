require './book.rb'

describe Book do
    before(:each) do
        @book = Book.new("Harry Potter", "James Clean",)
    end
    
    it 'should have a title' do
        expect(@book.title).to eq("Harry Potter")
    end

    it 'should have an author' do
        expect(@book.author).to eq("James Clean")
    end

    it 'should have instance' do
        expect(@book).to be_an_instance_of(Book)
    end
end
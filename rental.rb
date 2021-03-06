class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rental << self

    @book = book
    book.rental << self
  end

  def attrs
    instance_variables.to_h { |ivar| [ivar.to_s.sub('@', ''), instance_variable_get(ivar)] }
  end
end

require './rental'

class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def attrs
    instance_variables.map { |ivar| [ ivar.to_s.sub('@', ''), instance_variable_get(ivar)] }.to_h
  end
end

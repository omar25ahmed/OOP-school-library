require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id, :type

  def initialize(age, id, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = id
    @rental = []
    @type = self.class.name
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  def attrs
    instance_variables.to_h { |ivar| [ivar.to_s.sub('@', ''), instance_variable_get(ivar)] }
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end







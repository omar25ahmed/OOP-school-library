require './person'

class Teacher < Person
  def initialize(age, name, id, specialization)
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

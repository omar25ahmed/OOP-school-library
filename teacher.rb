require './person'

class Teacher < Person
  def initialize(age, id, name, specialization)
    super(age, id, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

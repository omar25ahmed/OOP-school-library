require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, id, name, parent_permission)
    super(age, id, name, parent_permission: parent_permission)
    @classroom = rand(1..100)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end

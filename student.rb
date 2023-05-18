require_relative './person'
class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def add_classroom(classroom)
    @classroom = classroom
    @classroom.add_student(self) unless @classroom.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

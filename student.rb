require_relative './person'
class Student < Person
  attr_accessor :classroom

  def initialize(age, _name = 'Unknown', classroom:, parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end
end

student = Student.new 9, 'David', parent_permission: true, classroom: 3
puts student.classroom

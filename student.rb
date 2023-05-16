require_relative './person'
class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', classroom:, parent_permission:)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student = Student.new(9, 'David', classroom: 3, parent_permission: false)
puts student.age
puts student.name
puts student.classroom
puts student.play_hooky

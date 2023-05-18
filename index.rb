require_relative './student'
require_relative './classroom'

student = Student.new(9, 'David', parent_permission: false)
math_classroom = Classroom.new 'Math'

math_classroom.add_student(student)

puts student.classroom.label
puts math_classroom.students

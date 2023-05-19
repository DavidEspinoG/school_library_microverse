require_relative './person'
require_relative './student'
require_relative './book'
require_relative './rental'

student = Student.new(9, 'David', parent_permission: false)

book = Book.new 'Harry Potter', 'J.K.Rowling'

book.add_rental '2023/05/18', student

puts student.age
puts student.name
puts student.parent_permission
puts student.rentals
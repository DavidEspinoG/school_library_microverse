require_relative './book'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author} "
    end
    nil
  end

  def all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}"
    end
    nil
  end

  def create_person
    option = request_option 'Do you want to create a student (1) or a teacher (2)?: '
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_student
    age = request_option 'Age: '
    name = request_option 'Name: '
    permission = request_option 'Has parent permission? [Y/N]: '
    student = Student.new age, name, parent_permission: get_permission(permission)
    @people.push(student)
    nil
  end

  def create_teacher
    age = request_option 'Age: '
    name = request_option 'Name: '
    specialization = request_option 'Specialization: '
    teacher = Teacher.new age, specialization, name
    @people.push(teacher)
    nil
  end

  def create_book
    title = request_option 'Title: '
    author = request_option 'Author: '
    book = Book.new title, author
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index})Title: #{book.title}, Author: #{book.author} "
    end
    book = @books[gets.chomp.to_i]
    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) #{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = @people[gets.chomp.to_i]
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp
    book.add_rental date, person

    puts 'Rental created successfully'
  end

  def all_rentals
    id = request_option('ID of person: ').to_i
    filtered = @people.select { |person| person.id == id }
    puts "Person's name: #{filtered[0].name}"
    filtered[0].rentals.each do |rental|
      puts "Book name: #{rental.book.title}, date: #{rental.date}"
    end

    nil
  end

  private

  def get_permission(string)
    return true if string.downcase == 'y'

    false
  end

  def request_option(message)
    print message
    gets.chomp
  end
end

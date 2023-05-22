require_relative './app.rb'

class Main
  # def initialize
  #   @app = App.new
  # end

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def menu
    message = "Welcome to School Library App!\n\n"
    message << "Please choose an option by entering a number:\n"
    message << "1 - List all books\n"
    message << "2 - List all people\n"
    message << "3 - Create a person\n"
    message << "4 - Create a book\n"
    message << "5 - Create a rental\n"
    message << "6 - List all rentals for a given person id\n"
    message << "7 - Exit\n"
  end

  def run
    option = ''
    while option != '7'
      print menu
      option = gets.chomp
      puts 'Thanks for using this app' if option == '7'
      select_option_main option
    end
  end

  private

  def select_option_main(option)
    case option
    when '1'
      puts @app.all_books
    when '2'
      puts @app.all_people
    when '3'
      puts @app.create_person
    when '4'
      puts @app.create_book
    when '5'
      puts @app.create_rental
    when '6'
      puts @app.all_rentals
    end
  end

  def get_permission(string)
    return true if string.downcase == 'y'

    false
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
    print 'Do you want to create a student (1) or a teacher (2)?: '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new age, name, parent_permission: get_permission(permission)
    @people.push(student)
    nil
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new age, specialization, name
    @people.push(teacher)
    nil
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
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
    print 'ID of person: '
    id = gets.chomp.to_i
    filtered = @people.select { |person| person.id == id }
    # binding.pry
    puts "Person's name: #{filtered[0].name}"
    filtered[0].rentals.each do |rental|
      puts "Book name: #{rental.book.title}, date: #{rental.date}"
    end

    nil
  end

end

main = Main.new
main.run

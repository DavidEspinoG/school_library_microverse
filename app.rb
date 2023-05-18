class App

  def menu
    message =  "Welcome to School Library App!\n\n"
    message << "Please choose an option by entering a number:\n"
    message << "1 - List all books\n"
    message << "2 - List all people\n"
    message << "3 - Create a person\n"
    message << "4 - Create a book\n"
    message << "5 - Create a rental\n"
    message << "6 - List all rentals for a given person id\n"
    message << "7 - Exit\n"
  end
  def all_books 
    'All books'
  end
  def all_people 
    'All people'
  end
  def create_person 
    'Create person'
  end
  def create_book 
    'Create book'
  end
  def create_rental
    'Create rental'
  end
  def all_rentals(id)
    'All rental'
  end

  def run 
    option = ''
    
    while option != '7'
      puts menu
      option = gets.chomp
      case option
      when '1'
        puts all_books
      when '2'
        puts all_people
      when '3'
        puts create_person
      when '4'
        puts create_book
      when '5'
        puts create_rental
      when '6'
        puts all_rentals 1
      when '7'
        puts 'Thanks for using this app!'
      else
        puts 'Not a valid option'
      end
    end  
  end

end

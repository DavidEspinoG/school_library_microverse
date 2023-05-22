require_relative './app.rb'

class Main
  def initialize
    @app = App.new
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

end

main = Main.new
main.run

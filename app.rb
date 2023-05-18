class App

  def menu
    puts "Welcome to School Library App!\nHola"
  end
  def all_books 
    'All books'
  end
  def all_people 

  end
  def create_person 

  end
  def create_book 

  end
  def create_rental

  end
  def all_rentals(id)

  end

  def run 
    option = ''
    if option == '7' 
      puts 'Thanks for using this app!'
    end
    while option != '7'
      puts menu
      option = gets.chomp
      if option == '7' 
        puts 'Thanks for using this app!'
      else 
        puts "Your option is #{option}"
      end
    end  
  end

end

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = 1
    @name = name
    @age = age
    @parent_permission = parent_permission
  end


  def can_use_services?
   if self.of_age? || @parent_permission
    return true
   else 
    return false
   end
  end

  private 

  def of_age? 
    if @age >= 18 
      return true
    else 
      return false
    end
  end

end

david = Person.new 11, parent_permission: false

puts david.name
puts david.age
puts david.can_use_services?

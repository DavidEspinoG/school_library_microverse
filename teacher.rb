require_relative './person'

class Teacher < Person
  attr_reader :age, :name, :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

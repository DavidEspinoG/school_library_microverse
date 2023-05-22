require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
  end
end

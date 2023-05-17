require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    return unless @nameable.correct_name.length > 10

    @nameable.correct_name.slice(0, 10)
  end
end

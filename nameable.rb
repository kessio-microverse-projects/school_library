
class Nameable
  def correct_name
    raise NotImplementedError, 'Please implement the correct_name method'
  end
end

class BaseDecorator < Nameable
  attr_accessor :nameable
def initialize(nameable)
  super()
  @nameable = nameable
end

def correct_name
  @nameable.correct_name
end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name[0, 9] if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end
class Show
  attr_reader :name, 
            :creator, 
            :characters

  def initialize(name, creator, characters)
    @name       = name
    @creator    = creator
    @characters = characters
  end

  def total_salary
    @characters.sum(&:salary)
  end

  def highest_paid_actor
    @characters.max_by(&:salary).actor
  end

  def actors
    @characters.map(&:actor)
  end
end

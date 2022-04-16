class Character
  attr_reader :name, 
            :actor, 
            :salary

  def initialize(attributes)
    @name   = attributes[:name]
    @actor  = attributes[:actor]
    @salary = attributes[:salary]
  end
end

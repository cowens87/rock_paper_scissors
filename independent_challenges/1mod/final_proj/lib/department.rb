class Department
  attr_reader :name, :employees

  def initialize(name)
    @name = name
    @employees = []
    @total = 0
  end

  def hire(employee)
    @employees << employee
  end

  def expense(value)
    if value.nil?
      @total = 0
    else
      @total += value
    end
  end

  def expenses
    @total
  end
end

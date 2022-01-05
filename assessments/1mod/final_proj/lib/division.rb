class Division
  attr_reader :name, :departments
  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def departments_w_multiple_employees
    multi_employee = []
    @departments.each do |department|
      if department.employees.count > 1
      multi_employee << department
      end
    end
    multi_employee
  end

  def employee_names
    names = []
    @departments.each do |department|
      department.employees.each do |employee|
        names << employee.name
      end
    end
    names
  end
end

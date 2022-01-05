require 'minitest/autorun'
require 'minitest/pride'
require './lib/employee'
require './lib/department'
require './lib/division'
require 'pry';

class Test < Minitest::Test
  # Iteration
  def test_it_has_attributes
    division = Division.new('Denver Division')

    assert_instance_of Division, division
    assert_equal 'Denver Division', division.name
  end

  def test_it_can_list_departments
    division = Division.new('Denver Division')
    sales = Department.new('Sales')
    finance = Department.new('Finance')

    assert_equal [], division.departments

    division.add_department(sales)
    division.add_department(finance)

    assert_equal [sales, finance], division.departments
  end

  def test_it_can_list_dept_w_multiple_employees
    division = Division.new('Denver Division')
    sales = Department.new('Sales')
    finance = Department.new('Finance')
    customer_service = Department.new('Customer Service')
    bobbi = Employee.new({name: 'Bobbi Jaeger', age: '30', salary: '100000'})
    megan = Employee.new({name: 'Megan Lewis', age: '22', salary: '120000'})
    jay = Employee.new({name: 'Jay Reginald', age: '25', salary: '90000'})
    harper = Employee.new({name: 'Harper Jenkins', age: '37', salary: '150000'})
    susan = Employee.new({name: 'Susan Smith', age: '27', salary: '150000'})

    division.add_department(sales)
    division.add_department(finance)
    division.add_department(customer_service)

    customer_service.hire(bobbi)
    customer_service.hire(megan)

    finance.hire(jay)

    sales.hire(harper)
    sales.hire(susan)

    assert_equal [sales, customer_service,], division.departments_w_multiple_employees
  end

  def test_it_can_list_all_employee_names
    division = Division.new('Denver Division')
    sales = Department.new('Sales')
    finance = Department.new('Finance')
    customer_service = Department.new('Customer Service')
    bobbi = Employee.new({name: 'Bobbi Jaeger', age: '30', salary: '100000'})
    megan = Employee.new({name: 'Megan Lewis', age: '22', salary: '120000'})
    jay = Employee.new({name: 'Jay Reginald', age: '25', salary: '90000'})
    harper = Employee.new({name: 'Harper Jenkins', age: '37', salary: '150000'})
    susan = Employee.new({name: 'Susan Smith', age: '27', salary: '150000'})

    division.add_department(sales)
    division.add_department(finance)
    division.add_department(customer_service)

    customer_service.hire(bobbi)
    customer_service.hire(megan)

    finance.hire(jay)

    sales.hire(harper)
    sales.hire(susan)

    expected = ["Harper Jenkins", "Susan Smith", "Jay Reginald", "Bobbi Jaeger", "Megan Lewis"]

    assert_equal expected, division.employee_names
  end
end

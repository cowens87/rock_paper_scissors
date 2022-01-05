require 'minitest/autorun'
require 'minitest/pride'
require './lib/employee'
require 'pry';

class EmployeeTest < Minitest::Test
  # Iteration 1
  def test_it_has_attributes
    bobbi = Employee.new({name: 'Bobbi Jaeger', age: '30', salary: '100000'})
    assert_instance_of Employee, bobbi
    assert_equal 'Bobbi Jaeger', bobbi.name
    assert_equal 30, bobbi.age
    assert_equal 100_000, bobbi.salary
  end
end

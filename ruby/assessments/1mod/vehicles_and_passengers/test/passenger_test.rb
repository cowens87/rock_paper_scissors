require "minitest/autorun"
require "minitest/pride"
require "./lib/passenger"
require "pry";

class PassengerTest < Minitest::Test
  # Iteration 1:
  # For the adult? method, a Passenger is considered an adult if they are
  # age 18 or older.
  def test_has_attributes
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    assert_instance_of Passenger, charlie
    assert_instance_of Passenger, taylor
    assert_equal "Charlie", charlie.name
    assert_equal 18, charlie.age
  end

  def test_is_an_adult
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    assert_equal true, charlie.adult?
    assert_equal false, taylor.adult?
  end

  def test_there_is_a_driver
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})


    assert_equal false, charlie.driver?

    charlie.drive

    assert_equal true, charlie.driver?
  end

end

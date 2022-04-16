require "minitest/autorun"
require "minitest/pride"
require "./lib/passenger"

class PassengerTest < Minitest::Test
  # Iteration 1
  def setup
    @charlie = Passenger.new({'name' => 'Charlie', 'age'=> 18})
    @taylor  = Passenger.new({'name' => 'Taylor', 'age'=> 12})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Passenger, @charlie
    assert_equal "Charlie", @charlie.name
    assert_equal 18, @charlie.age
  end

  def test_if_passenger_is_an_adult
  # For the `adult?` method, a `Passenger` is considered an adult if they
  # are age 18 or older
    assert_equal true, @charlie.adult?
    assert_equal false, @taylor.adult?
  end

  def test_if_the_passenger_is_the_driver
    assert_equal false, @charlie.driver?
    @charlie.drive
    assert_equal true, @charlie.driver?
  end
end

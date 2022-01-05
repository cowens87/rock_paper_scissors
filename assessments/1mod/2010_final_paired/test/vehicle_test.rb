require "minitest/autorun"
require "minitest/pride"
require "./lib/vehicle"
require "./lib/passenger"

class VehicleTest < Minitest::Test
  def setup
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Vehicle, @vehicle
    assert_equal '2001', @vehicle.year
    assert_equal 'Honda', @vehicle.make
    assert_equal 'Civic', @vehicle.model
  end

  def test_if_it_is_speeding
    assert_equal false, @vehicle.speeding?
    @vehicle.speed
    assert_equal true, @vehicle.speeding?
  end

  def test_if_vehicles_have_passengers
    assert_equal [], @vehicle.passengers
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    assert_equal [@charlie, @jude, @taylor], @vehicle.passengers
  end

  def test_it_can_find_number_of_adults
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    assert_equal 2, @vehicle.num_adults
  end
end

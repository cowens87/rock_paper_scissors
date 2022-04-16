require "minitest/autorun"
require "minitest/pride"
require "./lib/passenger"
require "./lib/vehicle"
require "./lib/drive_in"

class DriveInTest < Minitest::Test
  def setup
    @drive_in  = DriveIn.new("Big Movie Corporation")
    @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle_2 = Vehicle.new("1969", "Volkswagon", "Beetle")
    @vehicle_3 = Vehicle.new("2008", "Subaru", "Outback")
    @charlie   = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude      = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor    = Passenger.new({"name" => "Taylor", "age" => 12})
    @rupert    = Passenger.new({"name" => "Rupert", "age" => 27})
  end
  def test_it_has_attributes
    assert_instance_of DriveIn, @drive_in
    assert_equal "Big Movie Corporation", @drive_in.name
  end

  def test_there_are_vehicles_in_parking_lot
    assert_equal [], @drive_in.parking_lot

    @drive_in.park(@vehicle_1)
    @drive_in.park(@vehicle_2)

    assert_equal [@vehicle_1, @vehicle_2], @drive_in.parking_lot
  end

  def test_there_are_multiple_passengers
    @drive_in.park(@vehicle_1)
    @drive_in.park(@vehicle_2)
    @vehicle_1.add_passenger(@charlie)
    @vehicle_2.add_passenger(@jude)
    @vehicle_2.add_passenger(@taylor)
    @vehicle_3.add_passenger(@rupert)

    assert_equal [@vehicle_2], @drive_in.multiple_passengers
  end
# Tests I created to explore code
  def test_it_can_sort_passengers_by_vehicle
    @drive_in.park(@vehicle_1)
    @drive_in.park(@vehicle_2)
    @drive_in.park(@vehicle_3)
    @vehicle_1.add_passenger(@charlie)
    @vehicle_2.add_passenger(@jude)
    @vehicle_2.add_passenger(@taylor)
    @vehicle_3.add_passenger(@rupert)

    expected = {
                @vehicle_1 => [@charlie],
                @vehicle_2 => [@jude, @taylor],
                @vehicle_3 => [@rupert]
              }     
    assert_equal expected, @drive_in.passengers_by_vehicle
  end

  def test_it_can_find_cars_with_children 
    @drive_in.park(@vehicle_1)
    @drive_in.park(@vehicle_2)
    @drive_in.park(@vehicle_3)
    @vehicle_1.add_passenger(@charlie)
    @vehicle_2.add_passenger(@jude)
    @vehicle_2.add_passenger(@taylor)
    @vehicle_3.add_passenger(@rupert)

    assert_equal [@vehicle_2], @drive_in.cars_with_kids
  end
end

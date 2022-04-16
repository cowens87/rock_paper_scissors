require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/pantry"
require "./lib/event"
require "pry";

class EventTest < Minitest::Test
  def test_it_has_attributes
    event = Event.new("South Pearl Street Farmers Market")
    assert_instance_of Event, event
    assert_equal "South Pearl Street Farmers Market", event.name
  end
end

# users
dominic  = User.create!(fullname: "Blaire", email: "blaire@gmail.com", password: "password", bio: "I like driving.")
jake     = User.create!(fullname: "Claire", email: "claire@gmail.com", password: "password", bio: "I like driving.")
cydnee   = User.create!(fullname: "Cher", email: "cher@gmail.com", password: "password", bio: "I like driving.")
# routes/rides
ride1    = Ride.create!(origin: "5525 E Vassar Ave, Denver, CO 80222, USA", destination: "18681 E Brown Pl, Aurora, CO 80013, USA", departure_time: "09:00", user_id: jake.id )
ride2    = Ride.create!(origin: "4760 E Wyoming Pl, Denver, CO 80222, USA ", destination: "3995 S Jasper Ct, Aurora, CO 80013, USA", departure_time: "15:00", user_id: cydnee.id )
ride3    = Ride.create!(origin: "2620 S Ivy St, Denver, CO 80222, USA", destination: "3732 S Orleans St, Aurora, CO 80013, USA", departure_time: "10:00", user_id: dominic.id )
# matched_rides
friends1 = Friend.create!(user_id: jake.id, friend_id: dominic.id)
friends2 = Friend.create!(user_id: jake.id, friend_id: cydnee.id)
friends3 = Friend.create!(user_id: dominic.id, friend_id: cydnee.id)
friends4 = Friend.create!(user_id: dominic.id, friend_id: jake.id)
friends5 = Friend.create!(user_id: cydnee.id, friend_id: jake.id)
friends6 = Friend.create!(user_id: cydnee.id, friend_id: dominic.id)
# vehicles
pinto    = Vehicle.create!(user_id: dominic.id, make: 'Pinto', model: 'model', year: '1991')
geometro = Vehicle.create!(user_id: cydnee.id, make: 'Geo Metro', model: 'model', year: '1992')
geostorm = Vehicle.create!(user_id: jake.id, make: 'Geo Storm', model: 'model', year: '1988')
# ride days
mtw      = Rideday.create!(ride_id: ride1.id, day_of_week: ['Monday', 'Tuesday', 'Wednesday'])
twr      = Rideday.create!(ride_id: ride2.id, day_of_week: ['Tuesday', 'Wednesday', 'Thursday'])
mfs      = Rideday.create!(ride_id: ride3.id, day_of_week: ['Monday', 'Friday', 'Saturday'])


require 'rails_helper'

RSpec.describe '', type: :feature do
  describe '' do
    before(:each) do

    end

    it '' do
    end
  end
end
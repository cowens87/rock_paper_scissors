# Vehicles and Passengers Prework
​
## Iteration 1
​
Use TDD to create a `Passenger` class that responds to the following interaction pattern. For the `adult?` method, a `Passenger` is considered an adult if they are age 18 or older.
​
```ruby
pry(main)> require './lib/passenger'
# => true
​
pry(main)> charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
# => #<Passenger:0x00007fc1ad88b3c0...>
​
pry(main)> taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
# => #<Passenger:0x00007fe0da2cf1b0...>
​
pry(main)> charlie.name
# => "Charlie"
​
pry(main)> charlie.age
# => 18
​
pry(main)> charlie.adult?
# => true
​
pry(main)> taylor.adult?
# => false
​
pry(main)> charlie.driver?
# => false
​
pry(main)> charlie.drive
​
pry(main)> charlie.driver?
# => true
```
​
## Iteration 2
​
Use TDD to create a `Vehicle` class that responds to the following interaction pattern:
​
```ruby
pry(main)> require './lib/vehicle'
# => true
​
pry(main)> require './lib/passenger'
# => true
​
pry(main)> vehicle = Vehicle.new("2001", "Honda", "Civic")    
# => #<Vehicle:0x00007fe0da9c63d8...>
​
pry(main)> vehicle.year
# => "2001"
​
pry(main)> vehicle.make
# => "Honda"
​
pry(main)> vehicle.model
# => "Civic"
​
pry(main)> vehicle.speeding?
# => false
​
pry(main)> vehicle.speed
​
pry(main)> vehicle.speeding?
# => true
​
pry(main)> vehicle.passengers
# => []
​
pry(main)> charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
# => #<Passenger:0x00007fe0da1ec450...>
​
pry(main)> jude = Passenger.new({"name" => "Jude", "age" => 20})    
# => #<Passenger:0x00007fe0da2730e0...>
​
pry(main)> taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
# => #<Passenger:0x00007fe0da2cf1b0...>
​
pry(main)> vehicle.add_passenger(charlie)    
​
pry(main)> vehicle.add_passenger(jude)    
​
pry(main)> vehicle.add_passenger(taylor)    
​
pry(main)> vehicle.passengers
# => [#<Passenger:0x00007fe0da1ec450...>, #<Passenger:0x00007fe0da2730e0...>, #<Passenger:0x00007fe0da2cf1b0...>]
​
pry(main)> vehicle.num_adults
# => 2
```

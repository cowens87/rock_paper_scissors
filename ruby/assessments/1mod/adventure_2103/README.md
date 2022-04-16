## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR!

## Iteration 1 - Trails, Parks, Hikers

Use TDD to create Trail, Park, and Hiker that will respond to the interaction pattern below:

```ruby
pry(main)> require './lib/trail'
#=> true

pry(main)> require './lib/park'
#=> true

pry(main)> require './lib/hiker'
#=> true

pry(main)> trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
#=> #<Trail:0x00007fdd67232750 @length="2.2 miles", @level=:easy, @name="Grand Wash">

pry(main)> trail1.name
#=> "Grand Wash"

pry(main)> trail1.length
#=> 2.2

pry(main)> trail1.level
#=> :easy

pry(main)> trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
#=> #<Trail:0x00007fdd66946060 @length="1.7 miles", @level=:moderate, @name="Cohab Canyon">

pry(main)> park1 = Park.new('Capitol Reef')
#=> #<Park:0x00007fdd66927f48 @name="Capitol Reef", @trails=[]>

pry(main)> park1.name
#=> "Capitol Reef"

pry(main)> park1.trails
#=> []

pry(main)> park1.add_trail(trail1)

pry(main)> park1.add_trail(trail2)

pry(main)> park1.trails
#=> [#<Trail:0x00007fdd67232750...>, #<Trail:0x00007fdd66946060...>]

pry(main)> trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})
#=> #<Trail:0x00007fdd68019a30 @length="3.0 miles", @level=:moderate, @name="Tower Bridge">

pry(main)> park2 = Park.new('Bryce Canyon')
#=> #<Park:0x00007fdd672aa7f0 @name="Bryce Canyon", @trails=[]>

pry(main)> park2.add_trail(trail3)

pry(main)> hiker = Hiker.new('Dora', :moderate)
#=> #<Hiker:0x00007fdd6806da40 @experience_level=:moderate, @name="Dora", @parks_visited=[], @snacks={}>

pry(main)> hiker.name
#=> "Dora"

pry(main)> hiker.experience_level
#=> :moderate

pry(main)> hiker.snacks
#=> {}

pry(main)> hiker.pack('water', 1)

pry(main)> hiker.pack('trail mix', 3)

pry(main)> hiker.snacks
#=> {"water"=>1, "trail mix"=>3}

pry(main)> hiker.pack('water', 1)

pry(main)> hiker.snacks
#=> {"water"=>2, "trail mix"=>3}

pry(main)> hiker.parks_visited
#=> []

pry(main)> hiker.visit(park1)

pry(main)> hiker.visit(park2)

pry(main)> hiker.parks_visited
#=> [#<Park:0x00007fdd66927f48...>, #<Park:0x00007fdd672aa7f0...>]

```

## Iteration 2

Use TDD to update your classes to respond to the following interaction pattern:
  * `trails_shorter_than` returns an array of trails shorter than a given mileage
  * `hikeable_miles` returns a float that is the total of the miles of all the park's trails
  * `possible_trails` returns an array of trails at parks the hiker has visited, which match their experience_level

```ruby
pry(main)> require './lib/trail'
#=> true

pry(main)> require './lib/park'
#=> true

pry(main)> require './lib/hiker'
#=> true

pry(main)> trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
#=> #<Trail:0x00007fce55aa0fc0...">

pry(main)> trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
#=> #<Trail:0x00007fce568c3620...>

pry(main)> trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
#=> #<Trail:0x00007fce568e2f70...">

pry(main)> trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
#=> #<Trail:0x00007fce55b2e898...">

pry(main)> trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
#=> #<Trail:0x00007fce55b3f710...">                      

pry(main)> trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
#=> #<Trail:0x00007fce568fab98...>

pry(main)> park1 = Park.new('Capitol Reef')
#=> #<Park:0x00007fce55b4eee0...>

pry(main)> park2 = Park.new('Bryce Canyon')
#=> #<Park:0x00007fce57016b48...>

pry(main)> park1.add_trail(trail1)

pry(main)> park1.add_trail(trail2)

pry(main)> park1.add_trail(trail3)

pry(main)> park2.add_trail(trail4)

pry(main)> park2.add_trail(trail5)

pry(main)> park2.add_trail(trail6)

pry(main)> hiker = Hiker.new('Dora', :moderate)
#=> #<Hiker:0x00007fce55a91fc0...>

pry(main)> hiker.visit(park1)

pry(main)> hiker.visit(park2)

pry(main)> park1.trails_shorter_than(2.5)
#=> [#<Trail:0x00007fce55aa0fc0...>, #<Trail:0x00007fce568c3620...>]

pry(main)> park2.trails_shorter_than(2.5)
#=> []

pry(main)> park1.hikeable_miles
#=> 7.5

pry(main)> park2.hikeable_miles
#=> 16.9

pry(main)> hiker.possible_trails
#=> [#<Trail:0x00007fce568c3620...>, #<Trail:0x00007fce55b2e898...">, #<Trail:0x00007fce568fab98...>]
```

## Iteration 3

Use TDD to update your classes to respond to the following interaction pattern:
  * `favorite_snack` returns the name of the snack the hiker has packed the most of
  * `trails_by_level` returns a hash with keys that are the levels of trails at a given park, and values that are arrays of trail names which match that level.

```ruby
pry(main)> require './lib/trail'
#=> true

pry(main)> require './lib/park'
#=> true

pry(main)> require './lib/hiker'
#=> true

pry(main)> trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
#=> #<Trail:0x00007f90d8a39998...>

pry(main)> trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
#=> #<Trail:0x00007f90da085e90...>

pry(main)> trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
#=> #<Trail:0x00007f90da0a6258...>

pry(main)> trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
#=> #<Trail:0x00007f90d9891dd8...>

pry(main)> trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
#=> #<Trail:0x00007f90d98a1738...>

pry(main)> trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
#=> #<Trail:0x00007f90d98c0778...>

pry(main)> park1 = Park.new('Capitol Reef')
#=> #<Park:0x00007f90d98e2f30...>

pry(main)> park2 = Park.new('Bryce Canyon')
#=> #<Park:0x00007f90d80dc3c8...>

pry(main)> hiker = Hiker.new('Dora', :moderate)
#=> #<Hiker:0x00007f90d80ff558...>

pry(main)> hiker.pack('water', 2)

pry(main)> hiker.pack('trail mix', 1)

pry(main)> hiker.pack('apple', 4)

pry(main)> hiker.pack('carrot', 3)

pry(main)> hiker.favorite_snack
#=> "apple"

pry(main)> park1.add_trail(trail1)

pry(main)> park1.add_trail(trail2)

pry(main)> park1.add_trail(trail3)

pry(main)> park2.add_trail(trail4)

pry(main)> park2.add_trail(trail5)

pry(main)> park2.add_trail(trail6)

pry(main)> park1.trails_by_level
#=> {
#      :easy => ["Grand Wash"],
#      :moderate => ["Cohab Canyon"],
#      :strenuous => ["Chimney Rock Loop"]
#    }

pry(main)> park2.trails_by_level
#=> {
#      :moderate => ["Queen's/Navajo Loop", "Tower Bridge"],
#      :easy => ["Rim Trail"]
#    }
```

## Iteration 4

Use TDD to update your classes to respond to the following interaction pattern.  
  * **Do Not** break any prior functionality.
  * If a hiker visits the same park more than once, it is not repeated in their `visited_parks`
  * You will need to use stubs to manipulate when (the date) a hiker has visited a specific park.
  * `visitors_log` returns a hash containing date-specific information on each hiker's visit.  Along with the date, the log should show all the possible trails for that hiker.
  * Again, **DO NOT** break any of the iteration 1, 2, or 3 functionality.

```ruby
pry(main)> require './lib/trail'
#=> true

pry(main)> require './lib/park'
#=> true

pry(main)> require './lib/hiker'
#=> true

pry(main)> trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
#=> #<Trail:0x00007f8f022c6878...>

pry(main)> trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
#=> #<Trail:0x00007f8f040e25c8...>

pry(main)> trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
#=> #<Trail:0x00007f8f03191ee8...>

pry(main)> trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})
#=> #<Trail:0x00007f8f022e5160...>

pry(main)> park = Park.new('Bryce Canyon')
#=> #<Park:0x00007f8f022ed860...>

pry(main)> park.add_trail(trail1)

pry(main)> park.add_trail(trail2)

pry(main)> park.add_trail(trail3)

pry(main)> park.add_trail(trail4)

pry(main)> hiker1 = Hiker.new('Dora', :moderate)
#=> #<Hiker:0x00007f8f02184208...>

pry(main)> hiker2 = Hiker.new('Frank', :easy)
#=> #<Hiker:0x00007f8f029afb30...>

pry(main)> hiker3 = Hiker.new('Jack', :strenuous)
#=> #<Hiker:0x00007f8f04045e30...>

pry(main)> hiker4 = Hiker.new('Sally', :strenuous)
#=> #<Hiker:0x00007f8f02326390...>

#This visit occurs on June 23, 1980
pry(main)> hiker1.visit(park)

#This visit occurs on June 24, 1980
pry(main)> hiker2.visit(park)

#This visit occurs on June 24, 1980
pry(main)> hiker3.visit(park)

#This visit occurs on June 25, 1980
pry(main)> hiker4.visit(park)

#This visit occurs on June 23, 2020
pry(main)> hiker1.visit(park)

#This visit occurs on June 24, 2020
pry(main)> hiker2.visit(park)

#This visit occurs on June 24, 2020
pry(main)> hiker3.visit(park)

#This visit occurs on June 25, 2020
pry(main)> hiker4.visit(park)


pry(main)> park.visitors_log
#=>
#{
#  1980 => {
#    "06/23" => {
#      #<Hiker:0x00007f8f02184208...> => [#<Trail:0x00007f8f040e25c8...>, #<Trail:0x00007f8f03191ee8...>]
#    },
#    "06/24" => {
#      #<Hiker:0x00007f8f029afb30...> => [#<Trail:0x00007f8f022c6878...>],
#      #<Hiker:0x00007f8f04045e30...> => [#<Trail:0x00007f8f022e5160...>]
#    },
#    "06/25" => {
#      #<Hiker:0x00007f8f02326390...> => [#<Trail:0x00007f8f022e5160...>]
#    }
#  },
#  2020 => {
#    "06/23" => {
#      #<Hiker:0x00007f8f02184208...> => [#<Trail:0x00007f8f040e25c8...>, #<Trail:0x00007f8f03191ee8...>]
#    },
#    "06/24" => {
#      #<Hiker:0x00007f8f029afb30...> => [#<Trail:0x00007f8f022c6878...>],
#      #<Hiker:0x00007f8f04045e30...> => [#<Trail:0x00007f8f022e5160...>]
#    },
#    "06/25" => {
#      #<Hiker:0x00007f8f02326390...> => [#<Trail:0x00007f8f022e5160...>]
#    }
#  },
#}
pry(main)> hiker1.parks_visited
#=> [#<Park:0x00007f8f022ed860...>]
```

# School

## Instructions

* Fork this Repository
* Clone your forked repo
* Complete the activity Below
* Push your solution to your repo
* Submit a Pull Request from your repo to this repo
    * Put your name in your PR!

## Iteration 1

For iteration 1, we have created all of the tests you will need - unskip tests one by one (by removing 'skip') and make each pass before moving on to the next test.  The tests will model the following interaction pattern:

```ruby
pry(main)> require './lib/school'
#=> true

pry(main)> school = School.new('9:00', 7)
#=> #<School:0x007fcaf4957830 @hours_in_school_day=7, @start_time="9:00", @student_names=[]>

pry(main)> school.start_time
#=> "9:00"

pry(main)> school.hours_in_school_day
#=> 7

pry(main)> school.student_names
#=> []
```

## Iteration 2

For iteration 2, we have created all of the tests you will need - unskip tests one by one, making each pass before moving on the the next test.  The tests will model the interaction pattern below.
    * The `end_time` method should add the `hours_in_school_day` to the `start_time` and return the time in 24 hour format.  For example, 3:00 PM (12hour / clock time) is 15:00 (24hour). A school day will only ever start at the top of the hour (:00).

```ruby
pry(main)> require './lib/school'
#=> true

pry(main)> school = School.new('9:00', 7)
#=> #<School:0x007fcaf4957830 @hours_in_school_day=7, @start_time="9:00", @student_names=[]>

pry(main)> school.add_student_name('Aurora')
pry(main)> school.add_student_name('tim')
pry(main)> school.add_student_name('megan')

pry(main)> school.student_names
#=> ["Aurora", "tim", "megan"]

pry(main)> school.end_time
#=> "16:00"
```

## Iteration 3

Now, it is time for you to write your own tests!  Follow the interaction pattern below to write one test, make that test pass, and move on to the next test.  You will have at minimum, one test per new method.
    * A school is considered full time, if its has more than 4 hours in its school day.
    * The method `standard_student_names` will return a list of student names, capitalized ('megan' should become 'Megan').

```ruby
pry(main)> require './lib/school'
#=> true

pry(main)> school = School.new('9:00', 7)
#=> #<School:0x007fcaf4957830 @hours_in_school_day=7, @start_time="9:00", @student_names=[]>

pry(main)> school.is_full_time?
#=> true

pry(main)> school.add_student_name('Aurora')
pry(main)> school.add_student_name('tim')
pry(main)> school.add_student_name('megan')

pry(main)> school.standard_student_names
#=> ["Aurora", "Tim", "Megan"]
```

## Iteration 4

Continue writing tests to satisfy the following interaction pattern.
    * The method `convert_end_time_to_clock_time` will change the format of the end time to a 12 hour format (for example, 15:00 would be converted to 3:00).

```ruby
pry(main)> require './lib/school'
#=> true

pry(main)> school = School.new('9:00', 7)
#=> #<School:0x007fcaf4957830 @hours_in_school_day=7, @start_time="9:00", @student_names=[]>

pry(main)> school.convert_end_time_to_clock_time
#=> "4:00"
```

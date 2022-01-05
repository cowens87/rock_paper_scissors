# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## User Stories
Story 1 
As a user, When I visit the studio index page 
I see a list of all of the movie studios 
And underneath each studio, I see the names of all of its movies.

Story 2
As a user, When I visit a movie's show page. 
I see the movie's title, creation year, and genre, 
and a list of all its actors from youngest to oldest. 
And I see the average age of all of the movie's actors

Story 3
As a user, When I visit a movie show page, 
I see a form for an actors name 
and when I fill in the form with an existing actor's name I am redirected back to that movie's show page And I see the actor's name listed 
(You do not have to test for a sad path, for example if the id is not an existing actor)

Extension
Story 4 
As a user, When I visit an actor's show page 
I see that actors name and age And I see a unique list of all of the actors this particular actor has worked with.

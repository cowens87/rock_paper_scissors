# Hogwarts Again

## Setup instructions:
  - Fork this repo
  - `git clone <repo>`
  - `cd <repo_name>`
  - `bundle install`
  - `rails db:{create,migrate,seed}`

When you run rspec, you should have 12 failing tests to start.  

#user_stories 
### Submission

When you have completed this challenge, submit by creating a Pull Request back to the turingschool-examples repo. Include the following information:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through
---
### Requirements

* TDD all new work; any model METHODS you write must be fully tested.
---
### Not Required

* No visual styling is required or expected
---
### Before Starting User Stories

* This challenge uses a many-to-many relationship (your migrations are already built), be sure to check your setup/schema carefully.
* You also are starting with seeds, so if you need any objects for your tests, feel free to grab the ones from the seeds file.
* All model tests for validations and relationships have been made.
* You will have12 failing model tests as soon as you set up this challenge and run your tests (Let your instructor know if you are not seeing 12 failing tests)
* Get these tests to pass before moving on to the user stories below.
 
### User Stories
 
```
User Story 1 of 4
As a visitor,
When I visit '/professors',
I see a list of professors with the following information:
-Name
-Age
-Specialty
(e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
```
```
User Story 2 of 4
As a visitor,
When I visit '/professors/:id'
I see a list of the names of the students the professors have.
(e.g. "Neville Longbottom"
     "Hermione Granger"
     "Luna Lovegood")
```
```
User Story 3 of 4
As a visitor,
When I visit '/students'
I see a list of students and the number of professors each student has.
(e.g. "Draco Malfoy: 5"
     "Nymphadora Tonks: 10")
```
```
User Story 4 of 4
As a visitor,
When I visit '/professors/:id'
I see the average age of all students for that professor.
(e.g. "Average Age: 14.5")
```
---
### Extension
```
User Story Extension
On all index pages, all information is listed alphabetically.
	


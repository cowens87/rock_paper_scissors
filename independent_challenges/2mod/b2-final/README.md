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

## Description
Seattle Grace is based off of Grey's Anatomy, but you need NO knowledge of Grey's Anatomy to complete this final. Make sure to read all instructions, tasks, and user stories before getting started. 

## Database Information

* You will need to create all migrations. 
* Hospitals have many Doctors
* Doctors work for just one hospital 
* Doctors have many surgeries 
* Surgeries can have many doctors. 
* Hospitals have a name 
* Doctors have a name, specialty, and university that they attended 
* Surgeries have a title, day of the week ("Monday", "Tuesday", "Friday", etc...), and operating_room_number

## User Stories

```
User Story 1, Surgery Index
As a visitor 
When I visit a surgery’s index page (‘/surgeries’)
I see the title of all surgeries
And for each surgery I see the names of all doctors performing that surgery
```
```
User Story 2 , Surgery Show Page
As a visitor
When I visit the surgery index page
I can click on any surgery title to take me to that surgery’s show page
And on the show page I see the title and operating room number of that surgery
And I see a section of the page that says "Other surgeries happening this day of the week:"
And under that header I see titles of all surgeries that happen on the same day of the week as this surgery.
(Note: You do not need to use the created_at or updated_at columns for Surgeries)
```
```
User Story 3, Add a Doctor to a Surgery
As a visitor
When I visit a surgery's show page
I see a field with instructions to "Add A Doctor To This Surgery"
When I input the name of an existing Doctor into that field
And I click submit
I'm taken back to that surgery's show page
And I see the name of that doctor listed on the page
(Note: you do not need to handle any sad paths)
```

## Extensions

```
Extension, Hospital Surgery Index
As a visitor
When I visit a hospital’s surgery index (‘/hospitals/:id/surgeries’)
I see the titles of all surgeries associated with this hospital
And those surgeries are grouped by operating room

For example:

Operating Room #4311
Appendectomy
Cataract Removal

Operating Room #9500
Tonsillectomy

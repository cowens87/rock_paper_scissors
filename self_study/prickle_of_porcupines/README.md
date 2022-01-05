# <div align="center">  Lotus Flower Bomb
![image](https://user-images.githubusercontent.com/67389821/117156399-7b36d480-ad72-11eb-872c-755b1ada944e.png)
## Learning Goals

* Build out CRUD functionality for a many to many relationship
* Implement Drone CI
* Use ActiveRecord to write queries that join multiple tables of data together
* Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
* Validate models and handle sad paths for invalid data input
* Use flash messages to give feedback to the user
* Use partials in views
* Use `within` blocks in tests
* Track user stories using GitHub Projects
* Deploy an application to Heroku
## Description
Lotus Flower Bomb is an application in which users can explore movie options and create a Lotus Flower Bomb event for the user and their friends.
## Table of Contents
- [Schema](#schema)
- [Technology](#technology)
- [Achievements](#achievements)
- [Instructions](#instructions)
- [Design Strategy](#design-strategy)
- [Future Functionality](#future-functionality)
- [Contributors](#contributors)
- [Acknowledgements](#acknowledgements)

## Schema
![Schema](https://user-images.githubusercontent.com/67389821/117158257-1da38780-ad74-11eb-8147-3e6b8561a038.png)

## Technology
   ![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)    ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Code-CSS-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) 

## Instructions
This application is hosted on [Heroku](https://lotus-flower-bomb.herokuapp.com/), where you'll be able to view its functionality to the fullest.

For usage on your local machine follow the instructions listed below:
```
git clone https://github.com/cowens87/lotus_flower_bomb
cd lotus_flower_bomb
bundle install
rake db:{drop,create,migrate,seed}
rails server
```
Now, navigate to `http://localhost:3000/` on your browser to view the application!

## Achievements
- Continuous deployment to both Heroku
- Utilized TDD to ensure comprehensive application functionality, including both 'happy' and 'sad' paths.
- Applied principles of MVC to effectively organize code.
- Routing is organized and consistent and demonstrates use RESTful principles.
- Tests are well written and meaningful.
- Clear schema design with detailed and accurate diagram.
- Relationships modeled in the database correctly, including appropriate use of foreign keys.
   
## Contributor
[Cydnee Owens](https://github.com/cowens87)

## Challenges - Drone CI
- Unable to access remote server
- Unable to create drone.domain_name
- Limited information on implementing Drone CI without 3rd party app like Ubuntu
- Unable to test pipelines for testing


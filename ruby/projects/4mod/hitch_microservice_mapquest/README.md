<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

# Hitch Mapquest Microservice

[![Build Status](https://travis-ci.com/hitch-2011/hitch_microservice_mapquest.svg?branch=main)](https://travis-ci.com/hitch-2011/hitch_microservice_mapquest.svg?branch=main)
<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#rest-endpoints">ReST Endpoints</a></li>
    <li><a href="#created-by">Created By</a></li>

  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
This repository serves as a microservice to digest the mapquest api endpoints. 


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Postman](https://www.postman.com/)

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle install`
4. Local development needs an API key `https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register`
5. Create `.env` under `/app` 
```E.G
MAPQUEST_APIKEY = 'your token'
```
7. Start sinatra server
```
 $rackup or shotgun
 "rackup or shotgun will let you know which localhost port to navigate to"
```
### Prerequisites

* Ruby 2.5.3
* Rails 5.2.5

<!-- USAGE EXAMPLES -->

<details open>
<summary>ReST Endpoints</summary>
<br>
  
### Find Drivable Route
* Returns if route between two address is valid and drivable
> Required Parameters: `:address1` `:address2`
```
GET /find_drivable_route
```
### Created by:
- [Jake Volpe](https://github.com/javolpe) | [LinkedIn](https://www.linkedin.com/in/jake-volpe-bb602b126/)
- [Cydnee Owensl](https://github.com/cowens87) | [LinkedIn](https://www.linkedin.com/in/cydnee-owens-683a3450/)
- [Dominic Padula](https://github.com/domo2192) | [LinkedIn](https://www.linkedin.com/in/dominic-padula-5bb5b2179/)
- [Steven Mancine](https://github.com/itsnameissteven) | [LinkedIn](https://www.linkedin.com/in/steven-mancine-13509521/)
- [Paige Vannelli](https://github.com/PaigeVannelli) | [LinkedIn](https://www.linkedin.com/in/paigevannelli/)
- [Alex Thompson](https://github.com/alexthompson207) | [LinkedIn](https://www.linkedin.com/in/alex-thompson-he-him/)


</details>

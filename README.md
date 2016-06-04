## Genome Coding Challenge

System requirements
- Architect and implement and Rails-based API for a hypothetical restaurant. The API should be able to support Customers, Admin Users (the restaurant owners), Menu Items, and Orders.
- Set up the API to store data with Postgres.
- Implement unit testing for base API methods.
- Include swagger documentation

##  How to Run

1. Bundle Install
2. bundle exec rake db:create
3. bundle exec rake db:migration
4. bundle exec rake db:seed
5. bundle exec rake swagger:docs
6. bundle exec rails s

Visit [http://localhost:3000](http://localhost:3000) to view the Swagger Documentation or alternatively localhost:3000/public/index.html

## Testing

run 'bundle exec rspec' to run the unit testing

## User Authentication

- I am attempting to use devise token authentication. Although I am only supporting email signup, omniauth is a dependency of this gem.
- User roles are setup using the enum function. All users are set to default as customers and then programmers can upgrade their settings.
- I have not yet setup the fully robust and secure User Authentication system, but I cam confident I can complete the taks. 

## JSON Response Format

I used the following guide [JSON Api](http://jsonapi.org/format/) as a starting point.

- Currently Patch Requests and Delete Requests are not returning any content

## Push to Production

[https://genome-restaurant.herokuapp.com/](https://genome-restaurant.herokuapp.com/)
- Unfortunately after a debugging, running:
'heroku run rake swagger:docs' will not actually creation the public json file :(. 
[Stack Overflow Post](http://stackoverflow.com/questions/12123050/no-permanent-filesystem-for-heroku)
- A work around is to run:

'bundle exec rake swagger:docs RAILS_ENV='production' prior to pushing up.
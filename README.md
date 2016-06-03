## Genome Coding Challenge

System requirements
- Architect and implement and Rails-based API for a hypothetical restaurant. The API should be able to support Customers, Admin Users (the restaurant owners), Menu Items, and Orders.
- Set up the API to store data with Postgres.
- Implement unit testing for base API methods.
- Include swagger documentation

##  How to Run

1. bundle exec rake db:create
2. bundle exec rake db:migration
3. bundle exec rake db:seed

Visit localhost:3000 to view the Swagger Documentation or alternatively localhost:3000/public/index.html

## Testing

run 'bundle exec rspec' to run the unit testing
- Some validation and error handling on the order creation still need to be compelted

## User Authentication

- I am attempting to use devise token authentication. Although I am only supporting email signup, omniauth is a dependency of this gem.
- User roles are setup using the enum function. All users are set to default as customers and then programmers can upgrade their settings.

## JSON Response Format

I used the following guide [JSON Api](http://jsonapi.org/format/) as a starting point.


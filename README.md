# Slack notifier for inventory in real time

## Synopsis
This application is used to send notifications to a certain Slack channel reacting to the inventory socket service provided to do this test.

# Getting Up and Running
This project is using Ruby 2.6.5
## Slack Access

Please sign up to this Slack Workspace https://join.slack.com/t/aldo-potloc/shared_invite/zt-13sayiyea-G5s_40P01RtWKo3sEw6pJQ

## Clone the repository
- Create a folder called potloc 
- Clone the repo inside potloc's folder `git clone https://github.com/liquean/slack-notifier`
- Inside potloc copy the `shoe-store` project

## Bundle
- On a terminal got to the `slack-notifier` folder and run `bundle install`

## Database
- Copy `example.database.yml` to `database.yml` and edit it according your needs.
- Assuming you have postgres running run `rake db:setup`

## Start server
- First go to the shoe-store project and start the inventory socket using `websocketd --port=8080 ruby inventory.rb`
- On another terminal tab go to the backend folder and run `rails s -p3001` (It's really important to run it on port 3001)

## That's it
Whenever the inventory of a given model gets lower than 5 units the current app is going to send a Slack notification to `general` channel.
You may expect two kind of notifications
1. One notification showing the store that has a low inventory quantity of a model
2. Given the first notification, the system is going to send another notification listing between 1-3 stores that can provide the model that is in low quantity.

## Test
To run existing tests run `bin/rails test`

# Some ideas
The existing project could be improved by adding couple of extra cool functionality like:
- A REST API endpoint to get the inventory by model across the stores
- A REST API to query the state of the inventory between a range of two dates

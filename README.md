# Segmentation for Contacts

this is an application to filter some contacts by a certain condition like:
- Contacts with age greater than 10 years old: `age > 10`
- Contacts with email from gmail and age greater than 20 years old: `age > 20 AND email like '%gmail'`

[online demo](http://segmentacao2heroku.herokuapp.com)

# How to use

- Fill your contacts base ([demo](http://segmentacao2heroku.herokuapp.com/contacts/new))
- Create an segmentation ([demo](http://segmentacao2heroku.herokuapp.com/segmentations/new)) and Add conditions on it.
- Run your segment and you view the contacts that match with your condition ([demo](http://segmentacao2heroku.herokuapp.com/segmentation_workspace))

# Begin now!

How can i run localy? follow these steps

## Requirements

- Postgres 9.4 (default instalation, next next...)
- Ruby 2.2.4
- Rails 5.0.1 (if you are using windows try [railsInstaller](http://railsinstaller.org/) and follow [this tutorial](http://railsapps.github.io/installing-rails.html))

## Steps

We are assuming that you have a rails 5.0.1 and your default ecosystem (the omakase specs)

- Checkout this repository
- Config your database, change the file `config\database.yml` and put your database user and password, or put the full qualified URL to your local database.
- run `bundle` or `bundle install` to install all the gem that we needed.
- run `rails db:migrate`, this will generate the development database.
- run `rails db:seed`, this will fill the database with the default data.
- run `rails s`, the server will start on the http://localhost:3000/

## Run Tests

To setup the local testes, you must run the previously steps.

- run `rails db:migrate RAILS_ENV=test`, this will create de database of ours tests.
- run `rails db:seed RAILS_ENV=test`, this will fill ours test database.
- run `rails test <PATH>` ou to run all tests `rails test`

## Development Enviroment

- Lookout whe you are commiting yours files, and not commit some config files with local access credetial.

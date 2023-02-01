# ContactsApp 💻

This is a Ruby on Rails app for performing CRUD (Create, Read, Update, and Delete) actions on contacts. It uses the Devise gem for authentication and PostgreSQL database for storage.

## Prerequisites

- Ruby 2.6.5 or later
- Rails 6.0.3 or later
- PostgreSQL 12 or later

## Installation

1. Clone the repository:

`git clone` git@github.com:juliangaspar/my-contacts-app.git

2. Install the dependencies:

`bundle install`
`yarn install`

3. Create, migrate a seed the database:

`rails db:create
 rails db:migrate
 rails db:seed`

 4. Start the server

`rails server` and go to your [localhost:3000](http://localhost:3000) | Also run `yarn build --watch`

## Usage

- Sign up or log in to your account. Check `rails c` for seeded Users with contacts.

## Contributing

1. Fork the repository

2. Create your feature branch

3. Commit and push your changes to the branch

4. Submit a pull request



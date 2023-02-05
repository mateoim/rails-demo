# rails-demo

A simple Ruby on Rails test app.

## Usage

Configuration:

1. Configure database settings in `config/database.yml`
2. Create an `.env` file that should have Redis url defined as `REDIS_URL`, the default is `redis://redis:6379/0`

### Run using Docker

To run the app using Docker simply run `docker-compose build` and `docker-compose up`.

Note: Database is configured externally so it is not included in the Docker image.

### Run locally

Make sure you have [Ruby](https://www.ruby-lang.org/en/) installed as well as
Gems [Ruby on Rails](https://rubyonrails.org) and [Bundler](https://bundler.io).
To install all Gem dependencies run `bundle install`.

To run workers you will need [Redis](https://redis.io) and [Sidekiq](https://sidekiq.org).
Once installed, run Redis server using `redis-server` and run Sidekiq using `bundle exec sidekiq`.

### Using the application

The application runs on `localhost:3000` by default.
The homepage displays a list of available exchange rate providers and each name is a link to that provider's page.
Provider's page displays the latest exchange rates.
There are two optional query parameters on the provider's page:
1. `date` to select the date for which to display exchange rates
2. `currencies` to select currencies to display. Currencies are a list of comma separated currency codes. Any currencies not provided by the provider will be skipped.

# rails-demo

A simple Ruby on Rails test app.

## Usage

Configuration:

1. Configure database settings in `config/database.yml`
2. Create an `.env` file that should have Redis url defined as `REDIS_URL`

### Run using Docker

To run the app using Docker simply run `docker-compose build` and `docker-compose up`.

Note: Database is configured externally so it is not included in the Docker image.

### Run locally

Make sure you have [Ruby](https://www.ruby-lang.org/en/) installed as well as
Gems [Ruby on Rails](https://rubyonrails.org) and [Bundler](https://bundler.io).
To install all Gem dependencies run `bundle install`.

To run workers you will need [Redis](https://redis.io) and [Sidekiq](https://sidekiq.org).
Once installed, run Redis server using `redis-server` and run Sidekiq using `bundle exec sidekiq`.

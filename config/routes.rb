# frozen_string_literal: true

Rails.application.routes.draw do
  resources :exchange_rate_providers do
    resources :exchange_rates
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'exchange_rate_providers#index'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  mount Sidekiq::Web => '/sidekiq'
end

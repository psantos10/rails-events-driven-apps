# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :payment_requests

  # Defines the root path route ("/")
  root 'payment_requests#index'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :payment_requests, only: [] do
    member do
      post :accept
      post :reject
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'payment_requests#index'
end

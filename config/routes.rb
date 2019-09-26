# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home' => 'home#index'
  get '/logout', to: 'sessions#destroy', as: :logout
  resources :messages, only: [:new, :create]
  get 'fake' => 'sessions#fake'

  match '/auth/steam/callback' => 'sessions#create', via: [:get, :post]
  root 'home#index'
end

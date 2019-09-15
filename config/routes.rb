# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'home' => 'home#index'

  match '/auth/steam/callback' => 'sessions#create', via: [:get, :post]

  get '/logout', to: 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

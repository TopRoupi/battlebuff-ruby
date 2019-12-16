# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home' => 'home#index'

  get 'logout', to: 'sessions#destroy', as: :logout
  get 'fake' => 'sessions#fake'

  resources :messages, only: %i[new create]

  resources :rooms, only: %i[index new create show]

  match '/auth/steam/callback' => 'sessions#create', via: %i[get post]
  root 'home#index'
end

Rails.application.routes.draw do
  
  root 'home#index'

  get 'home' => 'home#index'

  post 'auth/steam/callback' => 'home#auth_callback'

  get 'logout' => 'home#logout'

  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

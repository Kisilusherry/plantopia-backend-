Rails.application.routes.draw do
  # Users routes for registration
  resources :users, only: [:create]

  # Session routes for login management
  resources :sessions, only: [:create]

  # Plant routes for viewing plants
  resources :plants, only: [:index, :show]

  # Favorites routes for managing user favorites
  resources :favorites, only: [:index, :create, :destroy]

  # Cart routes for shopping cart management
  resources :carts, only: [:index, :create, :update, :destroy]
  
  # Additional routes can be added here
end

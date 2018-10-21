Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  resources :pokemons

  patch 'capture', to: 'pokemons#capture', as: 'capture'
  patch 'damage', to: 'pokemons#damage', as: 'damage'
end

Rails.application.routes.draw do
  root "welcome#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/pokedex", to: "users#index"
  delete "/logout", to: "sessions#destroy"

  resources :welcome, only: [:index]
  resources :pokemons, only: [:show]

  resources :users, only: [ :index]
end

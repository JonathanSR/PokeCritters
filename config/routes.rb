Rails.application.routes.draw do
  root "welcome#show"

  resources :welcome, only: [:index]
end

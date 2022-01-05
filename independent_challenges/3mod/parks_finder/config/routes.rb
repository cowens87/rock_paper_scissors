Rails.application.routes.draw do
  root "welcome#index"
  resources :parks, only: [:index]
  resources :avatars, only: [:index] #Avatar the last airbender
end

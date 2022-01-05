Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :professors, only: [:index, :show]
  resources :students, only: [:index]
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :boba_teas
  resources :teahouses do 
    resources :boba_teas, controller: 'teahouse_boba_teas', only: [:index, :new, :create]
  end 
  resources :requests do 
    resources :boba_teas, controller: 'boba_tea_requests', only: [:create]
  end 

  namespace :admin do 
    resources :requests, only: [:show]
  end 
end

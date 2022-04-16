Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  namespace :admin do
    root :to => 'dashboard#index'
    resources :merchants, except: [:destroy]
    resources :invoices, except: [:destroy]
  end

  resources :merchants do
    member {get 'dashboard'}
    resources :items, except: [:destroy], controller: :merchant_items
    resources :invoices, only: [:index, :show], controller: :merchant_invoices
    resources :invoice_items, only: [:update], controller: :merchant_invoice_items
    resources :discounts, controller: :merchant_discounts
  end

  resources :github, only: [:show], controller: :github_api
end

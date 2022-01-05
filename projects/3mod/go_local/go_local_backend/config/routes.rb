Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users/:id', to: 'users#create'
      get '/place_search', to: 'place_search#place_search_request'
      get '/place_details', to: 'place_details#details_request'
      
      namespace :users do
        post '/:user_id/favorites/:excursion_id', to: 'favorites#add_favorite'
        delete '/:user_id/favorites/:excursion_id', to: 'favorites#delete_favorite'
        get '/:id/favorites', to: 'favorites#index'
        get '/:id/excursions', to: 'excursions#index'
        post '/:id/excursions', to: 'excursions#create'
        patch '/:id/excursions/:id', to: 'excursions#update'
        delete '/:id/excursions/:id', to: 'excursions#destroy'
      end

      resources :excursions, only: [:index, :show]
    end
  end
end



Rails.application.routes.draw do
  get 'jwt_authentication/generate_token'
  get 'jwt_authentication/verify_token'

    namespace :api do
    namespace :v1 do
      root to: 'base#index'

      # Authentication routes
      post 'login', to: 'authentication#login'
      post 'auth/validate_token', to: 'authentication#validate_token'
           
      # Static pages routes
      get 'static_pages/about'

      # Application resource routes
      resources :applications, only: [:create, :show, :update, :index] do
        member do
          put 'cancel'
          post 'select_match'
          get 'matches'
          put 'matches'
          patch 'booking', to: 'applications#booking'
          post 'payment', to: 'applications#payment'
          get 'generate_contract', to: 'applications#generate_contract'
          put 'signed_contract', to: 'applications#signed_contract'
          get 'download_contract', to: 'applications#download_contract'
        end
      end
      
      # Dogs resource routes
      resources :dogs, only: [:show, :index, :update] do
        member do
          post 'favourite'
        end
      end
      
      # Fetch user's favourites
      get 'users/favourites', to: 'dogs#user_favourites'

      # Users resource routes
      resources :users, only: [:create, :update, :show]

      # Admin namespace routes
      namespace :admin do
        # Admin dashboard route
        get 'dashboard', to: 'dashboard#index'

        resources :dogs, only: [:create, :index, :show, :update]
        resources :applications, only: [:index, :show, :update]
        resources :users, only: [:index, :show, :update]
      end
    end
  end

end

Rails.application.routes.draw do
  get 'jwt_authentication/generate_token'
  get 'jwt_authentication/verify_token'

  # Defines the root path route ("/")
  root 'home#index'

    namespace :api do
    namespace :v1 do
      # Authentication routes
      post 'login', to: 'authentication#login'
           
      # Static pages routes
      get 'static_pages/about'
      get 'static_pages/home'

      # Application resource routes
      resources :applications, only: [:create, :show, :index] do
        member do
          post 'cancel'
          post 'select_match'
          post 'schedule_interview'
          post 'schedule_virtual_meet_greet'
          post 'schedule_adoption_day'
          get 'matches'
        end
      end
      
      # Dogs resource routes
      resources :dogs, only: [:new, :create, :edit, :update, :show, :index] do
        member do
          post 'favourite'
        end
      end
      
      # Users resource routes
      resources :users, only: [:create, :update, :show]

      # Admin namespace routes
      namespace :admin do
        resources :dogs, only: [:new, :create, :index, :show, :update]
        resources :applications, only: [:index, :show, :update]
        resources :users, only: [:index, :show, :update]
      end
    end
  end

end

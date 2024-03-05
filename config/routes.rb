Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'home#index'

  
  namespace :api do
    namespace :v1 do
      
      mount_devise_token_auth_for 'User', at: 'auth'
      
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


# Users (2 types – adopters and admin)
# o	GET - /Users/:id/profile
# 	Form to edit user profile
# o	PUT - /Users/:id/profile
# 	Update user profile
# Applications
# o	GET - /Application/new
# 	Form to create a new application
# o	GET - /Applications (admin)
# 	To view all applications, allowing admin users to review and manage applications in various stages.
# o	POST - /Applications
# 	Submit a new application
# o	GET - /Application/:id
# 	View a specific application’s details
# o	POST - /Applications/:id/cancel
# 	Allow adopters to cancel their application.
# o	POST - /Applications/:id/select-match
# 	For adopters to select a dog from matches to move forward with the application.
# o	POST - /Applications/:id/schedule/interview
# 	Schedule an interview
# o	POST - /Applications/:id/schedule/virtual-meet-greet
# 	Schedule a virtual meet & greet
# o	POST - /Applications/:id/schedule/adoption-day
# 	Schedule the adoption day
# o	GET - /Applications/:id/matches
# 	View dog matches for the application based on the matching criteria
# Dogs
# o	GET - /Dogs/new (admin)
# 	Form to add new dog
# o	POST - /Dogs (admin)
# 	Submit a new dog
# o	GET - /Dogs
# 	View all dogs
# o	GET - /Dogs/:id/edit (admin)
# 	Form to edit a dog’s details
# o	PUT - /Dogs/:id/edit (admin)
# 	Update a dog’s details
# o	GET - /Dogs/favourites
# 	View logged in user’s favourite dogs
# o	GET - /Dogs/:id
# 	View a specific dog’s details
# o	POST - /Dogs/:id/favourite
# 	Toggle the favourite status of a dog for the logged-in user, combining the creation and deletion of favourites into one action based on current state. */
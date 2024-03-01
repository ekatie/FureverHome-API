Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root 'home#index'

  mount_devise_token_auth_for 'User', at: 'auth'

end

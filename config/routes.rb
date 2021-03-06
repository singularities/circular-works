Rails.application.routes.draw do
  mount_ember_app :frontend, to: "/", as: 'root'

  resources :organizations
  resources :tasks
  resources :turns
  resources :groups

  post 'invitations', to: 'invitations#create'

  get '/echo', to: 'echo#show'

  unless ENV['PRECOMPILE']
    mount_devise_token_auth_for 'User', at: 'users', skip: [:omniauth_callbacks]
  end
end

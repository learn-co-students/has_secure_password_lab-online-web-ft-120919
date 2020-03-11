Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]

  root 'users#welcome'
  
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: :logout
  get '/welcome', to: 'users#welcome', as: :welcome
end
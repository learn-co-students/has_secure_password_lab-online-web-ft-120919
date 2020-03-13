Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'users#new'
  post '/', to: 'users#create'
  get '/new', to: 'sessions#new'
  post '/new', to: 'sessions#create'
  get '/user', to: 'users#show'
end

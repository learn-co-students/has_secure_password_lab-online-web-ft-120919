Rails.application.routes.draw do
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/login' =>  'sessions#new', as: 'login'
  # post '/session' => 'sessions#create'


end

# frozen_string_literal: true

Rails.application.routes.draw do
  post 'users/create', to: 'users#create'
  get 'users/create', to: 'sessions#create'
  get 'user/new', to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

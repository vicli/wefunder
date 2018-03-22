Rails.application.routes.draw do
  # get 'sessions/new'

  root 'dashboard#index'

  # get    '/signup',  to: 'users#new'
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'

  resources :tournaments
  resources :rounds
  resources :matches
  resources :contestants
end

Rails.application.routes.draw do
  # get 'sessions/new'

  root 'tournaments#index'

  # get    '/signup',  to: 'users#new'
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'

  resources :tournaments do
    member do
      get :generate_finalists
    end
      resources :rounds do
      member do
        post :finish
      end
    end
    resources :matches
    resources :contestants
  end

end

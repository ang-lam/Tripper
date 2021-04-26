Rails.application.routes.draw do
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :activities

  resources :destinations do
    resources :itineraries, only: [:index, :new, :create, :show]
  end

  resources :itineraries do
    resources :activities, only: [:new, :create]
  end
  
end

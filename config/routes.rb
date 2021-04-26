Rails.application.routes.draw do
  resources :activities
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :destinations do
    resources :itineraries, only: [:index, :new, :create]
  end

  resources :itineraries do
    resources :activities, only: [:new, :create]
  end
  
end

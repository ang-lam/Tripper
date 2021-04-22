Rails.application.routes.draw do
  resources :activities
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :itineraries
  resources :destinations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

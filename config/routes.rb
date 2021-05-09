Rails.application.routes.draw do
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :destinations, only: [:index, :new, :create] do
    resources :itineraries, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
      delete :destroy_all, on: :collection
    end
  end

  resources :itineraries, only: [:show, :create, :update, :destroy]

  
end

Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: %i[index show]
  resources :categories, only: %i[show]

  resource :cart, only: %i[show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: %i[create show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: %i[edit update show]
    resources :categories, only: %i[index new create]
  end

  resources :about, only: %i[index]

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end


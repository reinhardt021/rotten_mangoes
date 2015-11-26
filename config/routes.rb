RottenMangoes::Application.routes.draw do
  resources :movies do 
    resources :reviews, only: [:new, :create]
  end

  get '/search' => "movies#index" 

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'movies#index'

  namespace :admin do
    resources :users, only: [:index]
  end
end

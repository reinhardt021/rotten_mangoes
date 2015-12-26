RottenMangoes::Application.routes.draw do
  root to: 'movies#index'

  resources :movies do 
    resources :reviews, only: [:new, :create, :destroy]
  end

  get '/search' => "movies#index" 

  resources :users, only: [:new, :create, :show]
  resources :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end
end

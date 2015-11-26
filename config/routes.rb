RottenMangoes::Application.routes.draw do
  resources :movies do 
    resources :reviews, only: [:new, :create, :destroy]
  end

  get '/search' => "movies#index" 

  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]

  root to: 'movies#index'

  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end

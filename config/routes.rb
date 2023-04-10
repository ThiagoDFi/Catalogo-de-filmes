Rails.application.routes.draw do

  root to: 'home#index'

  resources :movie_genres, only: [:show, :index, :new, :create, :edit, :update] do
    get 'movies', on: :member
  end
  resources :directors, only: [:show, :index, :new, :create, :edit, :update] do
    get 'movies', on: :member
  end
  resources :movies, only: [:show, :index, :new, :create, :edit, :update] 
end

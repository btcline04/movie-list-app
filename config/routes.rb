Rails.application.routes.draw do
  get 'movies/new'
  resources :lists, :movies
  root 'lists#index'
end

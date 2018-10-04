Rails.application.routes.draw do
  get 'movies/new'
  resources :lists, :movies
  root 'lists#index'

  get '/lists/:id/list_movies', to: 'lists#list_data'
end

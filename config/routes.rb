Rails.application.routes.draw do
  resources :lists, :movies
  root 'lists#index'
  get '/lists/:id/list_movies', to: 'lists#list_movies'
end

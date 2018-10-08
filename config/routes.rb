Rails.application.routes.draw do
  resources :lists, :movies
  get '/search', to: 'searches#index'
  post '/search', to: 'searches#omdb'
  root 'lists#index'
  get '/lists/:id/list_movies', to: 'lists#list_movies'
end

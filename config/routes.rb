Rails.application.routes.draw do
  resources :lists, :movies
  get '/search', to: 'searches#index'
  post '/search', to: 'searches#omdb'
  root 'lists#index'
  post '/add_api_movie_to_list', to: 'movies#add_api_movie_to_list'
end

Rails.application.routes.draw do
  resources :lists, :movies
  get '/search', to: 'searches#index'
  post '/search', to: 'searches#omdb'
  root 'lists#index'
end

Rails.application.routes.draw do
  devise_for :users
  root to: "dresses#index"
  resources :dresses 
  resources :genres
  get '/dresses/:id/genre', to: 'dresses#search'
end

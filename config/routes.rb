Rails.application.routes.draw do
  devise_for :users
  root to: "dresses#index"
  resources :dresses do
    resources :mylists
  end
  resources :genres

  get '/mylists', to: 'mylists#index', as: 'mylists_index'
end

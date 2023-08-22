Rails.application.routes.draw do
  devise_for :users
  root to: "dresses#index"
  resources :dresses
end

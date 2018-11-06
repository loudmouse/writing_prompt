Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :prompts
  resources :users, only: [:show, :index]
end

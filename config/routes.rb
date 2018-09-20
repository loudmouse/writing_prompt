Rails.application.routes.draw do
  devise_for :users
  root "prompts#index"
  resources :prompts
  resources :users, only: [:show]
end

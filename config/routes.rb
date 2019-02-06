Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :prompts
  resources :freewrites
  resources :users, only: [:show, :index]

  get 'me', action: :show, controller: 'users'
  get 'write', action: :new, controller: 'prompts'
end

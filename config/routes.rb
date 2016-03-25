Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :problems
  resources :submit, only: [:index, :show, :create]

  root to: "home#index"
end

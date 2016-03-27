Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :problems
  resources :submit, only: [:index, :show, :create]
  resources :test_cases, except: [:index]

  root to: "home#index"

  mount ActionCable.server => '/cable'
end

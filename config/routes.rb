Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :problems

  root to: "home#index"
end

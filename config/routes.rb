Rails.application.routes.draw do
  devise_for :users
  get 'ranking', to: "home#ranking"

  resources :problems
  resources :submit, only: [:index, :show, :create]
  resources :test_cases, except: [:index]

  root to: "home#index"
end

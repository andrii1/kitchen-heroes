Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: 'pages#dashboard'
  resources :listings do
    resources :bookings, only: [:new, :create, :accept, :reject]
  end
end

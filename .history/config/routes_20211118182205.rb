Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: 'pages#dashboard'
  patch "accept", to 'pages#dashboard', as "accept_path"
  patch "reject", to 'pages#dashboard', as "reject_path"
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: 'pages#dashboard'
  patch "accept", to 'pages#accept', as: :accept
  patch "reject", to 'pages#reject', as: :reject
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
end

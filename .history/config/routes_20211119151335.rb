Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: 'pages#dashboard', as: :dashboard
  patch "accept", to: 'bookings#accept', as: :accept
  patch "reject", to: 'bookings#reject', as: :reject
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [] do
    resources :reviews, only: :create
  end
end

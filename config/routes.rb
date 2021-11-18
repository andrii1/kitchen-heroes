Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
end

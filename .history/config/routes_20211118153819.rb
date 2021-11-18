Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get  to: 'pages#dashboard'
  resources :listings
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :listings
  resources :pages, except: :home do
    resources :listings, only: [ :new, :create ]
  end
  resources :listings, only: :destroy
end

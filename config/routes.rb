Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, except: :home do
    resources :listings, only: [ :new, :create ]
  end
  resources :listings, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings
end

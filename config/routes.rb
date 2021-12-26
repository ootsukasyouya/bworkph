Rails.application.routes.draw do
  root "stores#index"
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :maps
  resources :stores
  resources :conversations do
    resources :messages
  end
  post 'guest_login', to: "guest_sessions#create"
  post 'admin_guest_login', to: "admin_guest_sessions#create"
  namespace :admin do
    resources :users
  end
end

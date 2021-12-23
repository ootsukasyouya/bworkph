Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :maps
  post 'guest_login', to: "guest_sessions#create"
  post 'admin_guest_login', to: "admin_guest_sessions#create"
  namespace :admin do
    resources :users
  end
end

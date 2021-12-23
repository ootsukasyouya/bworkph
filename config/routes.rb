Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :maps
  post 'guest_login', to: "guest_sessions#create"
  namespace :admin do
    resources :users
  end
end

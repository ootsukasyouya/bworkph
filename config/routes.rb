Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :maps
  resources :stores
  post 'guest_login', to: "guest_sessions#create"
  post 'admin_guest_login', to: "admin_guest_sessions#create"
  namespace :admin do
    resources :users
  end
  before_action :set_search
  private
  def set_search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end
  get 'items/search'
end

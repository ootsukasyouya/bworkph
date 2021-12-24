class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

    def index
      @stores = current_user.stores
      @store = Store.all.page(params[:page]).per(8).order('created_at DESC')
      @favorites = current_user.favorite_stores
    end

    def show
        @favorite = current_user.favorites.find_by(store_id: @store.id)
    end

    def new
      @store = Store.new
    end

    def edit
    end

    def create
      @store = current_user.stores.build(store_params)
      if @store.save
        redirect_to @store
      else
        render new_store_path
      end
    end

    def update
      store = current_user.stores.find(params[:id])
      if current_user.stores.update(store_params)
        redirect_to @store
      else
        render store_show
      end
    end

    def destroy
      @store.destroy
      redirect_to @store
    end

    private
      def set_store
        @store = current_user.stores.find(params[:id])
      end
      def store_params
        params.require(:store).permit(:name, :profile, :addres, :phone_number, :how_to_work, :how_to_earn, :tratement, :go_to_work, :skill, :salary, :time_zone, :station_on_foot, :age_group, :prefecture_name, :atmosphere,:station_name)
      end
  end

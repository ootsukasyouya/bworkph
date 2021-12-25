class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

    def index
      if params[:employee]
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')

      else
        @stores = current_user.stores.page(params[:page]).per(8).order('created_at DESC')
        @favorites = current_user.favorite_stores
      end
      if params[:how_to_work].present? && params[:how_to_earn].present? && params[:treatment].present?
         # && params[:go_to_work].present? && params[:skill].present? && params[:salary].present? && params[:time_zone].present? && params[:atmosphere].present? && params[:age_group].present? && params[:station_on_foot].present? && params[:prefecture_name].present?
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')
        @stores = @stores.search_how_to_work(params[:how_to_work]).search_how_to_earn(params[:how_to_earn]).search_treatment(params[:treatment]).page(params[:page])
        # .search_go_to_work(params[:go_to_work]).search_skill(params[:skil]).search_salary(params[:salary]).search_time_zone(params[:time_zone]).search_atmosphere(params[:atmosphere]).search_age_group(params[:age_group]).search_station_on_foot(params[:station_on_foot]).search_prefecture_name(params[:prefecture_name])
      elsif params[:how_to_work].present? && params[:how_to_earn].present?
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')
        @stores = @stores.search_how_to_work(params[:how_to_work]).search_how_to_earn(params[:how_to_earn]).page(params[:page])
      elsif params[:how_to_work].present? && params[:treatment].present?
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')
        @stores = @stores.search_how_to_work(params[:how_to_work]).search_treatment(params[:treatment]).page(params[:page])
      elsif params[:how_to_earn].present? && params[:treatment].present?
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')
        @stores = @stores.search_how_to_earn(params[:how_to_earn]).search_treatment(params[:treatment]).page(params[:page])
      elsif params[:how_to_work].present?
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')
        @stores = @stores.search_how_to_work(params[:how_to_work]).page(params[:page])
      elsif params[:how_to_earn].present?
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')
        @stores = @stores.search_how_to_earn(params[:how_to_earn]).page(params[:page])
      elsif params[:treatment].present?
        @stores = Store.all.page(params[:page]).per(8).order('created_at DESC')
        @stores = @stores.search_treatment(params[:treatment]).page(params[:page])
      end
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
        @store = Store.find(params[:id])
        # if params[:employee]
        #   @store = Store.find(params[:id])
        # else
        #   @store = current_user.stores.find(params[:id])
        # end
      end
      def store_params
        params.require(:store).permit(:name, :profile, :addres, :phone_number, :how_to_work, :how_to_earn, :tratement, :go_to_work, :skill, :salary, :time_zone, :station_on_foot, :age_group, :prefecture_name, :atmosphere,:station_name)
      end
  end

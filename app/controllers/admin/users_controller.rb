class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only: %i[ show edit destroy update]



  def index
   @users = User.select(:id, :name, :email, :admin).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to admin_users_path
      else
        render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path
    else
      redirect_to admin_users_path
      flash[:notice]="管理者自身は削除できません"
    end
  end

  private

  def if_not_admin
    unless current_user.admin?
      redirect_to new_session_path
      flash[:notice]="管理者以外はアクセスできません"
    end
  end
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confimation, :status, :age, :addres, :phone_number)
  end
end

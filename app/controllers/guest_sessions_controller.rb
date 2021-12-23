class GuestSessionsController < ApplicationController
  skip_before_action :login_required, only: [:create]
  def create
    user = User.find_or_create_by(email: "guest@exapmle.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.age = 1
      user.status = "会社員"
      user.addres = "netto"
      user.phone_number = 00000000
      user.admin = false
    end
      session[:user_id] = user.id
      flash[:success] = "ゲストユーザーとしてログインしました"
      redirect_to user_path(user.id)
  end
end

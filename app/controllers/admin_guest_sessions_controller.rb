class AdminGuestSessionsController < ApplicationController
  skip_before_action :login_required, only: [:create]
  def create
    user = User.find_or_create_by(email: "admin_guest@exapmle.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト管理者"
      user.status = "求職者"
      user.admin = true
    end
      session[:user_id] = user.id
      flash[:success] = "ゲスト管理者としてログインしました"
      redirect_to admin_users_path
  end
end

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    redirect_to new_session_path unless current_user
  end
  # def store_master!
  #   if current_user.status == "店舗"
  #
  #   else
  #     redirect_to user_show(current_user.id)
  #   end
  # end
end

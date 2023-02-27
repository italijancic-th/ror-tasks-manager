class ApplicationController < ActionController::Base

  before_action :parse_user_info_from_session
  before_action :confirm_logged_in

  private

  def parse_user_info_from_session
    @username = cookies[:username]
    @user_id = session[:user_id]
  end

  def logged_in?
    session[:user_id].present?
  end

  def confirm_logged_in
    unless logged_in?
      flash[:notice] = 'Please login'
      redirect_to login_path
    end
  end

end

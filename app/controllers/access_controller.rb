class AccessController < ApplicationController
  # display menu
  def menu
    @username = cookies[:username]
    @user_id = session[:user_id]
  end

  # Display login form
  def new

  end

  # Process login form data
  def create
    # Cookie set
    cookies[:username] = params[:username]
    # Session value set
    session[:user_id] = 2404
    flash[:notice] = 'Login successful'
    redirect_to menu_access_path
  end

  # Logout user
  def destroy
    redirect_to login_path
  end
end

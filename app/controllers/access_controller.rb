class AccessController < ApplicationController
  # display menu
  def menu
    parse_user_info_from_session
  end

  # Display login form
  def new
    parse_user_info_from_session
    if logged_in?
      redirect_to menu_access_path
    end
  end

  # Process login form data
  def create
    # Add log into development logs file
    logger.info(`[INFO]: Login User #{params[:username]}`)
    # Cookie set
    cookies[:username] = params[:username]
    # Session value set
    session[:user_id] = 2404
    flash[:notice] = 'Login successful'
    redirect_to menu_access_path
  end

  # Logout user
  def destroy
    # Add log into development logs file
    logger.info(`[INFO]: Logout User #{cookies[:username]}`)
    # Cookie set
    cookies[:username] = nil
    # Session value set
    session[:user_id] = nil
    # Flash message
    flash[:notice] = 'Logged out'
    redirect_to login_path
  end


end

class AccessController < ApplicationController

  skip_before_action :confirm_logged_in, only: [:new, :create]

  # Display menu
  def menu
    # Examples of render options
    # render('menu')
    # render(plain: 'Just render a plain text')
    # render(html: "<h1> HTML text </h1>")
    # render(json: Task.first)
    # render(xml: %w[dog cat mouse])
    # render(plain: 'OK', status: 200)
    # path_to_404 = Rails.root.join('public', '404.html')
    # Render file
    # render(file: path_to_404)
    #
    # Send file, so user can download it
    # send_file(path_to_404)
    # string = render_to_string(file: path_to_404)
    # logger.debug(string)
  end

  # Display login form
  def new
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

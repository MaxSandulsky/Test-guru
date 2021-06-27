class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      cookies[:target_path] ? (redirect_to cookies[:target_path]) : (redirect_to tests_path) # With verb POST cookies don't work
    else
      flash.now[:alert] = 'Verify Email or Password'
      render :new
    end
  end

  def exit
    session[:user_id] = nil

    redirect_to login_path
  end
end

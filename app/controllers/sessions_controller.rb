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

  def destroy
    reset_session

    redirect_to sessions_new_path
  end

  def reset_session
    @_request.reset_session
  end
end

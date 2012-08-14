class SessionsController < ApplicationController
  skip_before_filter :login_required, only: [:new, :create]
  def new
  end

  def admin
  end

  def create
    @failed =  false

    user = User.find_by_email(params[:email].downcase)
    if user && user.approval && user.authenticate(params[:password])

      cookies[:auth_token] = user.auth_token
      if user.role == "admin"
        redirect_to admin_path
      else
        redirect_to root_url, :notice => "Logged in!"
      end
    else
      @failed =  true
      flash.now[:alert] = "Log in failed."
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end

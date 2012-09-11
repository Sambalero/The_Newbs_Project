class SessionsController < ApplicationController
  skip_before_filter :login_required, only: [:new, :create]
  def new
  end

  def admin
  end

  def create
    @failed =  false #delete this line...

    user = User.find_by_email(params[:email].downcase)
    if user && user.approval && user.authenticate(params[:password])
      cookies[:auth_token] = {:value => user.auth_token, :expires => 8.hours.from_now }
# consider http://stackoverflow.com/questions/249797/how-to-i-dynamically-set-the-expiry-time-for-a-cookie-based-session-in-rails

      if user.role == "admin"
        redirect_to admin_path
      else
        redirect_to root_url, :notice => "Logged in!"
      end
    else
      @failed =  true #delete this line...
      flash.now[:alert] = "Log in failed."
      render "new"
    end
  end

  def destroy
    current_user = nil
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end

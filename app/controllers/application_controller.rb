class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper


  before_filter :instantiate_controller_and_action_names
  before_filter :login_required

  helper_method :current_user
  helper_method :signed_in? 

	private

  def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  end

  def login_required
    redirect_to login_path unless current_user 
  end

  def admin_required
    render "public/500.html" unless current_user && current_user.role == 'admin' 
  end

  def partner_required
    render "public/403.html" unless current_user && (current_user.role == 'partner') || (current_user.role == 'admin') 
  end

  def master_required
    render "public/403.html" unless current_user && (current_user.role == 'partner') || (current_user.role == 'admin') || (current_user.role = 'master')
  end

  def admin_or_self
    case
      when params[:user_id] == current_user.id.to_s then true
      when request.path.match(profile_path) then params[:user_id] = current_user.id
      else admin_required
    end 
  end

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def signed_in?
    !current_user.nil?
  end



end

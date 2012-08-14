class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper


  before_filter :instantiate_controller_and_action_names
  before_filter :login_required

  helper_method :current_user #confirm this is required as helper; also when put helpers here instead of in helpers folder?
	private

  def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  end

  def login_required
    redirect_to login_path unless current_user #think about redirect
  end

  def admin_required
    render "public/500.html" unless current_user.role == 'admin' 
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
# session[:user_id].nil? use Keith's syntax. Required? Recommended?
  end


end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "You are no longer registered with us."
      @current_user = nil
    end
    helper_method :current_user

    def users_building
      users_unit ||= Unit.find_by_resident_code(current_user.resident_code) if current_user
      @users_building ||= Building.find(users_unit.building_id)
    end
    helper_method :users_building

    def require_login
      unless current_user
        unless( (params[:controller] == "neighbourhoods" && params[:action] == "index") ||
                (params[:controller] == "users" && params[:action] == "create") ||
                (params[:controller] == "sessions" && params[:action] == "create") )
          flash[:reroute] = "You are not authorized to access the page"
          redirect_to root_path
        end
      end
    end

end

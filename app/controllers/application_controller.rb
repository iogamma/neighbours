class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initialize_user

  private

  def initialize_user
    @user = User.new
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end

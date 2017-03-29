class SessionsController < ApplicationController
  def new
    redirect_to root_path
  end

  def create
      if user = User.authenticate_with_credentials(params[:email].first, params[:password].first)
        users_hood_id = users_building.neighbourhood_id
        session[:user_id] = user.id
        # TODO: Assign signed cookie for admin only
        cookies.signed[:user_id] = user.id
        flash[:notice] = "You are now logged in."
        redirect_to neighbourhood_path(user_hood_id)
      else
      # If user's login doesn't work, tell them
      # and send them back to the login form.
        flash[:alert] = "Your login credentials do not match"
        redirect_to register_path
      end
  end

  def destroy
    session[:user_id] = nil
    # TODO: Perform for admins
    cookies.signed[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

end
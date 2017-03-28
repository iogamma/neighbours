class SessionsController < ApplicationController

  def create
      if user = User.authenticate_with_credentials(user_params)
        session[:user_id] = user.id
        # TODO: Assign signed cookie for admin only
        cookies.signed[:user_id] = user.id
        flash[:notice] = "You are now logged in."
        redirect_to root_path
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

  private
    def user_params
      params.require(:user).permit(:email,
                                   :password)
    end
end
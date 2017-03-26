class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  def create
    puts user_params
    if user = User.authenticate_with_credentials(user_params)
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in."
      redirect_to root_path
    else
    # If user's login doesn't work, tell them
    # and send them back to the login form.
      flash[:alert] = "Your login credentials do not match"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email,
                                   :password)
    end
end
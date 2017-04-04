class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # Defaults to false. Set true by other council members
    @user.on_council = true
    # Unit_id fetch logic
    users_unit = Unit.find_by_resident_code(user_params[:resident_code])
    if users_unit
      @user.unit_id ||= users_unit.id
    else

    end

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        cookies.signed[:user_id] = @user.id
        format.html {
          users_hood_id = users_building.neighbourhood_id
          flash[:notice] = "You are now logged in."
          redirect_to neighbourhood_path(users_hood_id)
        }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def update
    @user = User.find params[:id]
    @user_updated = @user.update(update_params)
    if @user_updated
      redirect_to admin_dashboard_path
    else
      redirect_to back
    end
  end

  private
    def user_params
      params.permit(:first_name,
                    :last_name,
                    :email,
                    :password,
                    :password_confirmation,
                    :resident_code)
    end

    def update_params
      params.require(:user).permit(:on_council)
    end

end

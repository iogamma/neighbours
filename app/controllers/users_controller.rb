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
    @user.unit_id ||= Unit.find_by_resident_code(user_params[:resident_code]).id;
    unless @user.unit_id
      # TODO: Error Logic
    end

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        cookies.signed[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "Registration successful" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :resident_code)
    end

end

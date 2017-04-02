class Admin::UsersController < ApplicationController
  def update
    @user = User.find params[:id]
    @update_user = @user.update(user_params)
    if @update_user
      redirect_to admin_root_path
    else
      redirect_to back
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_root_path, notice: 'notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :on_council
    )
  end
end

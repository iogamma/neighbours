class Admin::UsersController < ApplicationController
  def update
    @user = User.find params[:id]
    @update_user = @user.update(on_council: "t")
    if @update_user
      redirect_to admin_root_path
    else
      redirect_to admin_root_path
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_root_path, :flash => {:success => 'User was successfully destroyed.' } }
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

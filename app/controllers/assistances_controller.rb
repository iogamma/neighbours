class AssistancesController < ApplicationController

  def index
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistances = Assistance.all.where(neighbourhood_id: params[:neighbourhood_id]).order(created_at: :desc)
    @assistance = Assistance.new
  end

  def show
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistance = Assistance.find params[:id]
    @assistance_comment = AssistanceComment.new
    @assistance_comments = AssistanceComment.where(assistance_id: @assistance.id).sort_by(&:created_at).reverse
  end

  def create
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistance = Assistance.create(assistance_params)
    @assistance.user_id = current_user.id
    @assistance.neighbourhood_id = params[:neighbourhood_id]

    if @assistance.save
      redirect_to [@neighbourhood, :assistances], notice: 'Assistance created'
    else
      render :new
    end
  end

  def update
    @assistance = Assistance.find params[:id]
    @assistance_updated = @assistance.update(assistance_params)
    if @assistance_updated
      redirect_to neighbourhood_assistance_path
    else
      redirect_to neighbourhood_assistances_path, notice:"Vote result failed to submit."
    end
  end

  def destroy
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistance = Assistance.find params[:id]
    @assistance.destroy
    respond_to do |format|
      format.html { redirect_to [@neighbourhood, :assistances], notice: 'assistance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def assistance_params
    params.require(:assistance).permit(
      :title,
      :description
    )
  end

end

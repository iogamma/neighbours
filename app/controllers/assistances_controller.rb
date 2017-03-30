class AssistancesController < ApplicationController

  def index
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @assistances = Assistance.all.where(neighbourhood_id: params[:neighbourhood_id]).order(created_at: :desc)
    @assistance = Assistance.new
  end

  def show
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @assistance = Assistance.find params[:id]
  end

  def create
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @assistance = Assistance.create(assistance_params)
    @assistance.user_id = current_user.id
    @assistance.neighbourhood_id = params[:neighbourhood_id]

    if @assistance.save
      redirect_to [@neighbourhood, :assistances], notice: 'Assistance created'
    else
      render :new
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
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

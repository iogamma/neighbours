class AssistancesController < ApplicationController

  def index
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @assistances = Assistance.all.where(neighbourhood_id: params[:neighbourhood_id]).order(date: :desc)

  end

  def show
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @assistance = Assistance.find params[:id]
  end

  def new
    @assistance = Assistance.new
  end

  def create
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @assistance = Assistance.new(assistance_params)

    if @assistance.save
      redirect_to [:neighbourhood, :assistance], notice: 'Assistance created'
    else
      render :new
    end
  end

  private

  def assistance_params
    params.require(:assistance).permit(
      :neighbourhood_id,
      :user_id,
      :title,
      :description,
      :date
    )
  end

end

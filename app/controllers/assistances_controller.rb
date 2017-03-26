class AssistancesController < ApplicationController

  def index
    @assistances = Assistance.all.order(date: :desc)
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
  end

  def show
    @assistance = Assistance.find params[:id]
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
  end

  def new
    @assistance = Assistances.new
  end

  def create
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @assistance = @neighbourhood.assistances.create(assistance_params)
    @assistance.save
  end

  def assistance_params
    params.require(:assistance).permit(:neighbourhood_id, :user_id, :title, :description, :date)
  end

end

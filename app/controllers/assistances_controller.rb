class AssistancesController < ApplicationController

  def index
    @assistances = Assistance.all.order(created_at: :desc)
    @assistance_new = Assistance.new
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]

  end

  def show
    @assistance = Assistance.find params[:assistance_id]
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
  end

end

class AssistancesController < ApplicationController

  def index
    @assistances = Assistance.all.order(created_at: :desc)
    @assistance_new = Assistance.new
  end

  def show
    @assistance = Assistance.find params[:assistance_id]
  end
  
end

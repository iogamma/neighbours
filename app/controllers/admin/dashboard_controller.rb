class Admin::DashboardController < ApplicationController
  def index
    user_id = current_user.id
    @building = users_building
    @neighbourhood = Neighbourhood.find(@building.neighbourhood_id)
  end

  def alert
    @message = params[:message]
  end

  def chat
  end

end

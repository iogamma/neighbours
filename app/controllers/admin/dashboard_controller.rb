class Admin::DashboardController < ApplicationController
  def index
    @current_user = current_user
    @building = users_building
    neighbourhood_id = @building.neighbourhood_id
    @neighbourhood = Neighbourhood.find(neighbourhood_id)
    @poll = Poll.new
    @polls = Poll.where(neighbourhood_id: neighbourhood_id)
  end

  def create_poll
    new_poll = Poll.new(poll_params)
    new_poll["email"] = current_user["email"]
    new_poll["user_id"] = current_user["id"]
    new_poll["neighbourhood_id"] = users_building["neighbourhood_id"]

    if new_poll.save!
      respond_to do |format|
        format.js {}
      end
    end

  end

  def search
    @users = User.search(params[:search])
    respond_to do |format|
      format.js {}
    end
  end

  def poll_params
    params.permit(
      :title,
      :description
    )
  end
end

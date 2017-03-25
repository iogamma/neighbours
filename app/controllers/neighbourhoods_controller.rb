class NeighbourhoodsController < ApplicationController
  def index
  end

  def show
    @notices = Notice.find_by neighbourhood_id: params[:id]
    @assistances = Assistance.find_by neighbourhood_id: params[:id]
    @feeds = User.joins(@notices, @assistances).where(@notices.user_id = @assistances.user_id).sort_by(&:created_at).reverse
    @neighbourhoods = Neighbourhood.all
  end
end

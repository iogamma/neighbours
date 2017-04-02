class NeighbourhoodsController < ApplicationController
  def index
  end

  def show
    user_neighbourhood_id = users_building.neighbourhood_id
    @notices = Notice.where(neighbourhood_id: user_neighbourhood_id)
    @assistances = Assistance.where(neighbourhood_id: user_neighbourhood_id)
    @feeds = Kaminari.paginate_array((@assistances + @notices).sort_by(&:created_at).reverse).page(params[:page]).per(5)
    @polls = Poll.where(neighbourhood_id: user_neighbourhood_id).sort_by(&:created_at).reverse
    @events = Event.where(neighbourhood_id: user_neighbourhood_id).sort_by(&:created_at).reverse
    @neighbourhood = Neighbourhood.find(user_neighbourhood_id)
  end
end

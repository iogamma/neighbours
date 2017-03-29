class NeighbourhoodsController < ApplicationController
  def index
    render 'index'
  end

  def show
    users_hood_id = users_building.neighbourhood_id
    @notices = Notice.where(neighbourhood_id: users_hood_id)
    @assistances = Assistance.where(neighbourhood_id: users_hood_id)
    @feeds = Kaminari.paginate_array((@assistances + @notices).sort_by(&:created_at).reverse).page(params[:page]).per(10)
    @polls = Poll.where(neighbourhood_id: users_hood_id).sort_by(&:created_at).reverse
    @events = Event.where(neighbourhood_id: users_hood_id).sort_by(&:created_at).reverse
    @neighbourhood = Neighbourhood.find(users_hood_id)
  end
end

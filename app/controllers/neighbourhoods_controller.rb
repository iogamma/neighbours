class NeighbourhoodsController < ApplicationController
  def index

    render 'index'
  end

  def show  
    @notices = Notice.where(neighbourhood_id: params[:id])
    @assistances = Assistance.where(neighbourhood_id: params[:id])
    @feeds = (@assistances + @notices).sort_by(&:created_at).reverse

    @polls = Poll.where(neighbourhood_id: params[:id]).sort_by(&:created_at).reverse

    @events = Event.where(neighbourhood_id: params[:id]).sort_by(&:created_at).reverse
    
    @neighbourhood = Neighbourhood.find params[:id]
  end
end

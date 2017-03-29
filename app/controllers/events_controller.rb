class EventsController < ApplicationController
  
  def show
    @neighbourhood = Neighbourhood.find users_building.neighbourhood_id
    @event = Event.find params[:id]
  end

  def new
    
    @event = Event.new
  end

  def create
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @event = Event.create(event_params)
    @event.user_id = current_user.id
    @event.neighbourhood_id = user_neighbourhood_id

    if @event.save
      redirect_to [@neighbourhood, @event], notice: 'Event created'
    else
      render :new
    end
  end
  
  def destroy
    @neighbourhood = Neighbourhood.find users_building.neighbourhood_id
    @assistance = Event.find params[:id]
    @assistance.destroy
    respond_to do |format|
      format.html { redirect_to [@neighbourhood], notice: 'event is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :location,
      :date,
      :image
    )
  end

end

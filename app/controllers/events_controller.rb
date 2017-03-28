class EventsController < ApplicationController
  
  def show
    @event = Event.find params[:id]
  end

  def new
    @event = Event.new
  end

  def create
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @event = Event.create(event_params)
    @event.user_id = current_user.id
    @event.neighbourhood_id = params[:neighbourhood_id]

    if @event.save
      redirect_to [@neighbourhood, :events], notice: 'Event created'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :date
    )
  end

end

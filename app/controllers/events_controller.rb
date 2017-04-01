class EventsController < ApplicationController

  def show
    @event = Event.find params[:id]
    @event_comment = EventComment.new
    @event_comments = EventComment.where(event_id: @event.id).sort_by(&:created_at).reverse
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
      if event_params[:image].present?
        render :crop
      else
        redirect_to [@neighbourhood, @event], notice: 'Event created'
      end
    else
      render :new
    end
  end

  def update
    @neighbourhood = Neighbourhood.find users_building.neighbourhood_id
    @event = Event.find params[:id]

    if crop_params
      if @event.update crop_params
        redirect_to [@neighbourhood, @event], notice: 'Event updated'
      end
    else
      if @event.user_id = current_user.id
        return
      end
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find users_building.neighbourhood_id
    @event = Event.find params[:id]
    @event.destroy
    respond_to do |format|
      format.html { redirect_to neighbourhood_path, notice: 'event is successfully destroyed.' }
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

  def crop_params
    params.require(:event).permit(
      :crop_x,
      :crop_y,
      :crop_h,
      :crop_w
    )
  end

end

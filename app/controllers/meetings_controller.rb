class MeetingsController < ApplicationController

  def index
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @meetings = Kaminari.paginate_array(Meeting.where(neighbourhood_id: user_neighbourhood_id).sort_by(&:created_at).reverse).page(params[:page]).per(5)
    @meeting = Meeting.new
    @meeting.user_id = current_user.id
    @meeting.neighbourhood_id = users_building.neighbourhood_id
    @video = Video.new
    @document = Document.new
  end

  def create
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @meeting = Meeting.create(meeting_params)
    @meeting.user_id = current_user.id
    @meeting.neighbourhood_id = params[:neighbourhood_id]
    @meetings = Meeting.all.where(neighbourhood_id: params[:neighbourhood_id]).order(created_at: :desc)
    @video = Video.new
    @document = Document.new

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to neighbourhood_meetings_path, :flash => { :success => 'meeting was successfully created.'} }
      else
        format.html { redirect_to neighbourhood_meetings_path, alert: @meeting.errors.full_messages}
      end
    end
  end



  def update
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meetings = Meeting.where(neighbourhood_id: params[:neighbourhood_id]).sort_by(&:created_at).reverse
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meeting = Meeting.find params[:id]
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to [@neighbourhood, :meetings], :flash => { :success => 'meeting was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(
      :title,
      :location,
      :date
    )
  end


end

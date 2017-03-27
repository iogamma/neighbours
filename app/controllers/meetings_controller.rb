class MeetingsController < ApplicationController

  def index
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meetings = Meeting.all.where(neighbourhood_id: params[:neighbourhood_id]).order(created_at: :desc)
    @meeting = Meeting.new
    @meeting.user_id = current_user.id
    @meeting.neighbourhood_id = params[:neighbourhood_id]
  end

  def create
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meeting = Meeting.create(meeting_params)
    @meeting.user_id = current_user.id
    @meeting.neighbourhood_id = params[:neighbourhood_id]

    if @meeting.save
      redirect_to [@neighbourhood, :meetings], notice: 'Meeting posted'
    else
      render :new
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meeting = Assistance.find params[:id]
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to [@neighbourhood, :meetings], notice: 'meeting was successfully destroyed.' }
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

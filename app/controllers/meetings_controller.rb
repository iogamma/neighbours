class MeetingsController < ApplicationController

  def index
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meetings = Meeting.all.where(neighbourhood_id: params[:neighbourhood_id]).order(created_at: :desc)

  end

end

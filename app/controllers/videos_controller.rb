class VideosController < ApplicationController
  def create
    @meeting = Meeting.find params[:meeting_id]
    @video = @meeting.videos.create(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to neighbourhood_meetings_path, :flash => { :success => 'Video added to meeting details.'} }
      else
        format.html { redirect_to neighbourhood_meetings_path, :flash => { :error => @video.errors.full_messages} }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meeting = Meeting.find params[:meeting_id]
    @video = Video.find params[:id]
    @video.destroy
    respond_to do |format|
      format.html { redirect_to neighbourhood_meetings_path, :flash => { :success => "Video deleted"} }
      format.json { head :no_content }
    end
  end

  private

  def video_params
    params.require(:video).permit(
      :name,
      :location
      )
  end
end
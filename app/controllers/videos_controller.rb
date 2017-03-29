class VideosController < ApplicationController
  def create
    @meeting = Meeting.find params[:meeting_id]
    @video = @meeting.videos.create(video_params)
    if @video.save
      redirect_to(:back)
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meeting = Meeting.find params[:meeting_id]
    @video = Video.find params[:id]
    @video.destroy
    respond_to do |format|
      format.html { redirect_to(:back) }
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
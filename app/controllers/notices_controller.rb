class NoticesController < ApplicationController
  def index
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @notices = Notice.all.where(neighbourhood_id: params[:neighbourhood_id]).order(created_at: :desc)

  end

  def show
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @notice = Notice.find params[:id]
  end

  def new
    @notice = Notice.new
  end

  def create
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @notice = Notice.create(notice_params)
    @notice.user_id = current_user.id
    @notice.neighbourhood_id = params[:neighbourhood_id]

    if @notice.save
      redirect_to [@neighbourhood, :notices], notice: 'Notice created'
    else
      render :new
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @notice = Notice.find params[:id]
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to [@neighbourhood, :notices], notice: 'notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def notice_params
    params.require(:notice).permit(
      :title,
      :description,
      :date
    )
  end

end

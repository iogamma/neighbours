class NoticesController < ApplicationController
  def index
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @notices = Kaminari.paginate_array(Notice.where(neighbourhood_id: user_neighbourhood_id).sort_by(&:created_at).reverse).page(params[:page]).per(5)
    @notice = Notice.new
  end

  def show
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @notice = Notice.find params[:id]
  end

  def create
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @notice = Notice.create(notice_params)
    @notice.user_id = current_user.id
    @notice.neighbourhood_id = user_neighbourhood_id
    @notices = Kaminari.paginate_array(Notice.where(neighbourhood_id: user_neighbourhood_id).sort_by(&:created_at).reverse).page(params[:page]).per(5)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to [@neighbourhood, @notice], :flash => { :success => 'Notice was successfully created.'} }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { redirect_to neighbourhood_notices_path, :flash => {:error => @notice.errors.full_messages} }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @notice = Notice.find params[:id]
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to [@neighbourhood, :notices], notice: 'notice was successfully deleted.' }
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

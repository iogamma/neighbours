class AssistancesController < ApplicationController

  def index
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistances = Kaminari.paginate_array(Assistance.where(neighbourhood_id: @neighbourhood.id).sort_by(&:created_at).reverse).page(params[:page]).per(5)
    @assistance = Assistance.new
  end

  def show
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistance = Assistance.find params[:id]
    @assistance_comment = AssistanceComment.new
    @assistance_comments = AssistanceComment.where(assistance_id: @assistance.id).sort_by(&:created_at).reverse
  end

  def new
    @assistance = Assistance.new
  end

  def create
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistance = Assistance.create(assistance_params)
    @assistance.user_id = current_user.id
    @assistance.neighbourhood_id = params[:neighbourhood_id]
    @assistances = Kaminari.paginate_array(Assistance.where(neighbourhood_id: @neighbourhood.id).sort_by(&:created_at).reverse).page(params[:page]).per(5)
    respond_to do |format|
      if @assistance.save
        format.html { redirect_to [@neighbourhood, @assistance], :flash => { :success => 'Assistance was successfully created.'} }
        format.json { render :show, status: :created, location: @assistance }
      else
        format.html { redirect_to neighbourhood_assistances_path, :flash => { :error => @assistance.errors.full_messages} }
        format.json { render json: @assistance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistance = Assistance.find params[:id]
    @assistance_updated = @assistance.update(assistance_params)
    @assistance_comment = AssistanceComment.new
    @assistance_comments = AssistanceComment.where(assistance_id: @assistance.id).sort_by(&:created_at).reverse

    respond_to do |format|
      if @assistance_updated
        format.html { redirect_to neighbourhood_assistance_path(@assistance), :flash => { :success => 'Assistance was successfully updated.'} }
        format.json { render :show, status: :updated, location: @assistance }
      else
        format.html { redirect_to neighbourhood_assistance_path(@assistance), :flash => { :error => @assistance.errors.full_messages } }
        format.json { render json: @assistance.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    user_neighbourhood_id = users_building.neighbourhood_id
    @neighbourhood = Neighbourhood.find user_neighbourhood_id
    @assistance = Assistance.find params[:id]
    @assistance.destroy
    respond_to do |format|
      format.html { redirect_to [@neighbourhood, :assistances], :flash => { :success => 'assistance was successfully deleted.'}}
      format.json { head :no_content }
    end
  end

  private

  def assistance_params
    params.require(:assistance).permit(
      :title,
      :description
    )
  end

end

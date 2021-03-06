class CommentsController < ApplicationController
  def create
    if !current_user
      redirect_to login_path, alert: 'Please login to view event.'
    else
      case params[:type]
        when 'event'
          @event = Event.find params[:event_id]
          @comment = @event.event_comments.create(user_id: current_user.id, content: event_comment_params[:content])

          respond_to do |format|
            if @comment.save
              format.html {redirect_to neighbourhood_event_path(neighbourhood_id: users_building.neighbourhood_id, id: @event.id)}
            else
              format.html {redirect_to neighbourhood_event_path(neighbourhood_id: users_building.neighbourhood_id, id: @event.id), notice: 'Comment cannot be blank, not successfully saved'}
            end
          end

        when 'assistance'
          @assistance = Assistance.find params[:assistance_id]
          @comment = @assistance.assistance_comments.create(user_id: current_user.id, content: assistance_comment_params[:content])
          respond_to do |format|
            if @comment.save
              format.html {redirect_to neighbourhood_assistance_path(neighbourhood_id: users_building.neighbourhood_id, id: @assistance.id)}
            else
              format.html {redirect_to neighbourhood_assistance_path(neighbourhood_id: users_building.neighbourhood_id, id: @assistance.id), notice: 'Comment cannot be blank, not successfully saved'}
            end
          end
      end
    end
  end

  def destroy
    case params[:type]
      when 'event'
        @event = Event.find params[:event_id]
        @comment = @event.event_comments.find params[:id]
        respond_to do |format|
          format.html { redirect_to neighbourhood_event_path(neighbourhood_id: users_building.neighbourhood_id, id: @event.id), notice: 'comment deleted.' }
          format.json { head :no_content }
        end
      when 'assistance'
        @assistance = Assistance.find params[:assistance_id]
        @comment = @assistance.assistance_comments.find params[:id]
        respond_to do |format|
          format.html { redirect_to neighbourhood_assistance_path(neighbourhood_id: users_building.neighbourhood_id, id: @assistance.id), notice: 'comment deleted.' }
          format.json { head :no_content }
        end
    end
    @comment.destroy
  end

  # def update
  #   @event = Event.find params[:event_id]
  #   case params[:type]
  #     when 'event'
  #       @comment = @event.event_comments.find params[:id]
  #       @comment
  #     when 'assistance'
  #       return
  #   end
  #   respond_to do |format|
  #     format.html { redirect_to neighbourhood_event_path(neighbourhood_id: users_building.neighbourhood_id, id: @event.id), notice: 'event was successfully updated.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def event_comment_params
    params.require(:event_comment).permit(
      :content,
    )
  end

  def assistance_comment_params
    params.require(:assistance_comment).permit(
      :content,
    )
  end
end

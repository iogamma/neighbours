class CommentsController < ApplicationController
  def create
    if !current_user
      redirect_to login_path, notice: 'Please log in to review the product.'
    else
      case params[:type]
        when 'event'
          @event = Event.find params[:event_id]
          @comment = @event.event_comments.create(user_id: current_user.id, content: event_comment_params[:content])
          if @comment.save
            redirect_to neighbourhood_event_path(neighbourhood_id: users_building.neighbourhood_id, id: @event.id)
          else
            flash[:notice] = 'Comment cannot be blank, not successfully saved'
            render neighbourhood_event_path(neighbourhood_id: users_building.neighbourhood_id, id: @event.id), notice: 'Comment was not successfully saved'
          end
        when 'assistance'
          @assistance = Assistance.find params[:assistance_id]
          @comment = @assistance.assistance_comments.create(user_id: current_user.id, content: assistance_comment_params[:content])
          if @comment.save
            redirect_to neighbourhood_assistance_path(neighbourhood_id: users_building.neighbourhood_id, id: @assistance.id)
          else
            flash[:notice] = 'Comment cannot be blank, not successfully saved'
            redirect_to neighbourhood_assistance_path(neighbourhood_id: users_building.neighbourhood_id, id: @assistance.id), notice: 'Comment was not successfully saved'
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
          format.html { redirect_to neighbourhood_event_path(neighbourhood_id: users_building.neighbourhood_id, id: @event.id), notice: 'event was successfully destroyed.' }
          format.json { head :no_content }
        end
      when 'assistance'
        @assistance = Assistance.find params[:assistance_id]
        @comment = @assistance.assistance_comments.find params[:id]
        respond_to do |format|
          format.html { redirect_to neighbourhood_assistance_path(neighbourhood_id: users_building.neighbourhood_id, id: @assistance.id), notice: 'assistance was successfully destroyed.' }
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

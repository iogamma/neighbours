class DocumentsController < ApplicationController
  def create
    @meeting = Meeting.find params[:meeting_id]
    @document = @meeting.documents.create(document_params)
    respond_to do |format|
      if @document.save
        format.html { redirect_to neighbourhood_meetings_path, :flash => { :success => 'Document added to meeting details.'} }
      else
        format.html { redirect_to neighbourhood_meetings_path, :flash => { :error => @document.errors.full_messages} }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end




  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meeting = Meeting.find params[:meeting_id]
    @document = Document.find params[:id]
    @document.destroy
    respond_to do |format|
      format.html { redirect_to neighbourhood_meetings_path, :flash => { :success => "Document deleted"} }
      format.json { head :no_content }
    end
  end

  private

  def document_params
    params.require(:document).permit(
      :name,
      :location
      )
  end
end
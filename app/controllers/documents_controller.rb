class DocumentsController < ApplicationController
  def create
    @meeting = Meeting.find params[:meeting_id]
    @document = @meeting.documents.create(document_params)
    if @document.save
      redirect_to(:back)
    end
  end

  def destroy
    @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
    @meeting = Meeting.find params[:meeting_id]
    @document = Document.find params[:id]
    @document.destroy
    respond_to do |format|
      format.html { redirect_to(:back) }
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
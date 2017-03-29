class Admin::DashboardController < ApplicationController
  def index
    @unit = Unit.find(1)
    @notice = Notice.new
  end

  def alert
    @message = params[:message]
    respond_to do |format|
      format.js {}
    end
  end

  def chat
  end
end

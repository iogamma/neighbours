class PollsController < ApplicationController

  def update

    if Vote.where(poll_id: params[:poll], user_id: current_user.id).empty?
      @neighbourhood = Neighbourhood.find params[:neighbourhood_id]
      @vote = Vote.create(vote: params[:vote])
      @vote.user_id = current_user.id
      @vote.poll_id = params[:id]

      if @vote.save
        redirect_to @neighbourhood
      else 
        redirect_to @neighbourhood, notice:"Vote result failed to submit."
      end

    else
      redirect_to @neighbourhood, notice:"You have already Voted."
    end  
  end

end
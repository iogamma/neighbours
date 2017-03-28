class Vote < ApplicationRecord
  belongs_to :poll
  belongs_to :user

  def calc_yes_vote ()
    @yes_vote = @votes.where(vote: "yes").size
  end
end

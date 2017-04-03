class Vote < ApplicationRecord
  belongs_to :poll
  belongs_to :user

  def self.yes_calculation (id)
    if !Vote.where(poll_id: id).empty?
      total_votes = Vote.where(poll_id: id)
      yes_votes = total_votes.where(vote: "yes").size.to_f
      yes_to_total = (yes_votes / total_votes.size.to_f)*100
   else
      yes_to_total = 0
    end
  end

  def self.no_calculation (id)
    if !Vote.where(poll_id: id).empty?
      total_votes = Vote.where(poll_id: id)
      no_votes = total_votes.where(vote: "no").size.to_f
      no_to_total = (no_votes / total_votes.size.to_f)*100
    else
      no_to_total = 0
    end
  end

end


class EventComment < ApplicationRecord
  belongs_to :event
  belongs_to :users, optional: true

  def self.find_user(user_id)
    if !user_id
      "Anonymous"
    else
      user = User.find(user_id)
      "#{user.first_name} #{user.last_name}"
    end
  end

  validates :content, presence: true
end

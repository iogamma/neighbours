class AssistanceComment < ApplicationRecord
  belongs_to :assistance
  belongs_to :user

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

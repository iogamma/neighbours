class Assistance < ApplicationRecord
  belongs_to :user
  belongs_to :neighbourhood
  has_many :assistance_comments

  def table_name
    self.table_name
  end
  
end

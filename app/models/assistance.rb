class Assistance < ApplicationRecord
  belongs_to :user
  belongs_to :neighbourhood

  def table_name
    self.table_name
  end
  
end

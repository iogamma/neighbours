class Notice < ApplicationRecord
  belongs_to :neighbourhood
  belongs_to :user
end

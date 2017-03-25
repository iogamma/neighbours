class User < ApplicationRecord
  belongs_to :unit
  has_many :meetings
  has_many :notices
  has_many :events
  has_many :assistances
end

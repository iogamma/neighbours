class Neighbourhood < ApplicationRecord
  has_many :buildings
  has_many :events
  has_many :meetings
  has_many :notices
  has_many :polls
  has_many :users

end

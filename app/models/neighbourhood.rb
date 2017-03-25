class Neighbourhood < ApplicationRecord
  has_many :buildings
  has_many :meetings
  has_many :notices
  has_many :polls
end

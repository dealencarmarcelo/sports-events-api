class Event < ApplicationRecord
  belongs_to :organization
  belongs_to :sport

  has_many :users_events
  has_many :users, through: :users_events
  has_many :results
end

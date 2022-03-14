class Event < ApplicationRecord
  belongs_to :organization

  has_many :users_events
  has_many :users, through: :users_events
end

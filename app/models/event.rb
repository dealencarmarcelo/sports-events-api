class Event < ApplicationRecord
  belongs_to :organization, foreign_key: :host_id

  has_many :users_events
  has_many :participants, class_name: 'User', through: :users_events
end

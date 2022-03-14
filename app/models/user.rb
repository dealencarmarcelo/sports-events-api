class User < ApplicationRecord
  extend Enumerize

  has_many :results, foreign_key: :participant_id

  has_many :users_events
  has_many :events, through: :users_events

  enumerize :role, in: %w[organizer coach participant], predicates: true
end

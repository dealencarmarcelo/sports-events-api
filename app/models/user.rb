class User < ApplicationRecord
  extend Enumerize

  has_many :results

  has_many :users_events
  has_many :events, through: :users_events

  enumerize :role, in: %w[admin competitor], predicates: true
end

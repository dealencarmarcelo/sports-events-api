class Result < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :event

  enumerize :unit, in: %w[meters seconds]
end

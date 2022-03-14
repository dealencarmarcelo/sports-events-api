class Result < ApplicationRecord
  extend Enumerize

  belongs_to :user

  enumerize :unit, in: %w[meters seconds]
end

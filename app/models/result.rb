class Result < ApplicationRecord
  extend Enumerize

  belongs_to :participant, class_name: 'User'

  enumerize :unit, in: %w[meters seconds]
end

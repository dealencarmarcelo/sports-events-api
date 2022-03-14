class Sport < ApplicationRecord
  extend Enumerize

  has_many :events

  enumerize :win_condition, in: %w[greater shorter], predicates: true
end

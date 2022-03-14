class Sport < ApplicationRecord
  extend Enumerize

  has_many :event

  enumerize :win_condition, in: %w[greater shorter], predicates: true
end

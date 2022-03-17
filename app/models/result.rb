class Result < ApplicationRecord
  extend Enumerize

  attr_accessor :position

  belongs_to :user
  belongs_to :event
  has_one :sport, through: :event

  before_validation :validate_attempts
  before_validation :normalize_value

  def validate_attempts
    current_attempts = user&.results&.where(event_id: event.id)&.count || 0

    return if current_attempts < sport&.max_attempts

    errors.add(:result, 'max attempts')

    false
  end

  def normalize_value
    self.value = value.round(2)
  end

  enumerize :unit, in: %w[meters seconds]
end

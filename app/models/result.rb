class Result < ApplicationRecord
  extend Enumerize

  attr_accessor :position

  belongs_to :user
  belongs_to :event
  has_one :sport, through: :event

  before_validation :validate_attempts
  before_validation :validate_subscription
  before_validation :normalize_value

  def validate_attempts
    current_attempts = user&.results&.where(event_id: event.id)&.count || 0

    return if current_attempts < sport&.max_attempts

    errors.add(:message, I18n.t('errors.messages.max_attempts'))

    false
  end

  def validate_subscription
    return if event.user_ids.include?(user_id)

    errors.add(:message, I18n.t('errors.messages.not_subscribed'))

    false
  end

  def normalize_value
    self.value = value.round(2)
  end

  enumerize :unit, in: %w[meters seconds]
end

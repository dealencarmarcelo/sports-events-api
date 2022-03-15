class Event < ApplicationRecord
  belongs_to :organization
  belongs_to :sport

  has_many :users_events
  has_many :users, through: :users_events
  has_many :results

  validates_presence_of :name, :start_date, :end_date

  validate :verify_start_date

  private

  def verify_start_date
    return false unless start_date && end_date

    errors.add(:start_date, 'must be before end_date') unless start_date.before?(end_date)

    false
  end
end

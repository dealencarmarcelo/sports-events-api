class Event < ApplicationRecord
  belongs_to :organization
  belongs_to :sport

  has_many :users_events
  has_many :users, through: :users_events
  has_many :results

  validates_presence_of :name, :start_date, :end_date

  validates_comparison_of :end_date, greater_than: :start_date
  validates_comparison_of :end_date, greater_than: Date.yesterday

  scope :active, -> { where(active: true) }
  scope :active_by_dates, -> { where('active IS TRUE AND ? BETWEEN start_date AND end_date', Date.today) }

  def subscribe_if_not_exists(subscriber_id)
    raise ErrorHandler, :already_registered if users.where(id: subscriber_id).any?

    users_events.create(user_id: subscriber_id)
  end
end

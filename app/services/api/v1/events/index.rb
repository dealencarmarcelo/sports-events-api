# Event list service
class Api::V1::Events::Index
  prepend SimpleCommand

  def call
    fetch_events
  end

  private

  def fetch_events
    Event.order(name: :asc)
  end
end

# Event list service
class Events::Index
  prepend SimpleCommand

  def call
    fetch_events
  end

  private

  def fetch_events
    Event.order(name: :asc)
  end
end

# Result list service
class Api::V1::Results::Index
  prepend SimpleCommand

  def initialize(event)
    @event = event
  end

  def call
    fetch_results
  end

  private

  def fetch_results
    @event.results.order(value: :asc)
  end
end

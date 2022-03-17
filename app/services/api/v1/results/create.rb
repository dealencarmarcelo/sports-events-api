# Create result service
class Api::V1::Results::Create
  prepend SimpleCommand

  def initialize(event, params)
    @event = event
    @params = params
  end

  def call
    create_result
  end

  private

  def create_result
    result = @event.results.new(@params)

    errors.add(:result, result.errors) unless result.save

    result
  end
end

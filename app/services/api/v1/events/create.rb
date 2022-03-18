# Create event service
class Api::V1::Events::Create
  prepend SimpleCommand

  def initialize(params)
    @params = params
  end

  def call
    create_event
  end

  private

  def create_event
    event = Event.new(@params)

    errors.add(:event, event.errors) unless event.save

    event
  end
end

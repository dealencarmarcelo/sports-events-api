# Event update service
class Api::V1::Events::Update
  prepend SimpleCommand

  def initialize(event, params)
    @event = event
    @params = params
  end

  def call
    update_event
  end

  private

  def update_event
    @event.assign_attributes(@params)

    errors.add(event.errors) unless @event.save

    @event
  end
end

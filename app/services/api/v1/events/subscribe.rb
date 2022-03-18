# Event list service
class Api::V1::Events::Subscribe
  prepend SimpleCommand

  def initialize(event, user)
    @event = event
    @user = user
  end

  def call
    subscribe_user
  end

  private

  def subscribe_user
    @event.subscribe_if_not_exists(@user.id)
  end
end

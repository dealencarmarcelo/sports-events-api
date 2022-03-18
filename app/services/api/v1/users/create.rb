# Create result service
class Api::V1::Users::Create
  prepend SimpleCommand

  def initialize(params)
    @params = params
  end

  def call
    create_user
  end

  private

  def create_user
    user = User.new(@params)

    errors.add(:user, user.errors) unless user.save

    user
  end
end

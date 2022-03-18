class Api::V1::Auth::SignupService
  prepend SimpleCommand

  def initialize(auth_params)
    @auth_params = auth_params
  end

  def call
    signup
  end

  private

  attr_accessor :auth_params

  def signup
    user = User.new(@auth_params)

    raise ActiveRecord::RecordInvalid, user unless user.save && user.authenticate(@auth_params[:password])

    user.token = JsonWebToken.encode(id: user.id, email: user.email)

    user
  end
end

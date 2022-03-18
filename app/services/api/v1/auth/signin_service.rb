class Api::V1::Auth::SigninService
  prepend SimpleCommand

  def initialize(auth_params)
    @auth_params = auth_params
  end

  def call
    signin
  end

  private

  def signin
    user = User.find_by_email(@auth_params[:email])

    raise ErrorHandler, :invalid_credentials unless user&.authenticate(@auth_params[:password])

    user.token = JsonWebToken.encode(id: user.id, email: user.email)

    user
  end
end

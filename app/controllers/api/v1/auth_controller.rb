class Api::V1::AuthController < ApplicationController
  def signin
    sign_in_service = Api::V1::Auth::SigninService.call(auth_params)
    handle_response(sign_in_service)
  end

  def signup
    sign_up_service = Api::V1::Auth::SignupService.call(auth_params)
    handle_response(sign_up_service)
  end

  private

  def auth_params
    params.permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation,
      :role,
      :age
    )
  end

  def handle_response(service)
    render_response(service.result, service.result[:status])
  end
end

class Api::V1::UsersController < ApplicationController
  before_action :fetch_user

  def create
    create_service = Api::V1::Users::Create.call(user_params)

    handle_response(create_service, :ok)
  end

  def results
    results = @user.results

    render json: results, status: :ok
  end

  def events
    events = @user.events

    render json: events, status: :ok
  end

  private

  def user_params
    params.require(:user)
          .permit(
            :first_name,
            :last_name,
            :email,
            :role,
            :username,
            :age
          )
  end

  def fetch_user
    @user = User.find_by(id: params[:id])
  end

  def handle_response(service, status)
    if service.success?
      render_response(service.result, status)
    else
      render_unprocessable_entity_error(service.errors)
    end
  end
end

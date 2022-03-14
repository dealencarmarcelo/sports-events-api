class Api::V1::UsersController < ApplicationController
  before_action :fetch_user

  def results
    results = @user.results

    render json: results, status: :ok
  end

  def events
    events = @user.events

    render json: events, status: :ok
  end

  private

  def fetch_user
    @user = User.find_by(id: params[:id])
  end
end

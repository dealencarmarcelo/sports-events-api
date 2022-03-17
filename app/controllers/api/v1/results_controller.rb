# Results controller
class Api::V1::ResultsController < ApplicationController
  before_action :fetch_event, only: %w[index create]
  before_action :fetch_result, only: %w[show]

  def index
    index_service = Api::V1::Results::Index.call(@event)

    handle_response(index_service, :ok)
  end

  def show
    render json: @result, status: :ok
  end

  def create
    create_service = Api::V1::Results::Create.call(@event, results_params)

    handle_response(create_service, :created)
  end

  private

  def results_params
    params.require(:result)
          .permit(
            :event_id,
            :user_id,
            :unit,
            :value
          )
  end

  def fetch_result
    @result = Result.find_by(id: params[:id])
    render_error(I18n.t('errors.not_found')) unless @result
  end

  def fetch_event
    @event = Event.active_by_dates.find_by(id: params[:event_id])
    render_error(I18n.t('errors.inactive_event')) unless @event
  end

  def handle_response(service, status)
    if service.success?
      render_response(service.result, status)
    else
      render_unprocessable_entity_error(service.errors)
    end
  end
end

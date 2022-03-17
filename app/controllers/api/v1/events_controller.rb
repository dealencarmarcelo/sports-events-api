# Events controller
class Api::V1::EventsController < ApplicationController
  before_action :fetch_event, only: %w[show update ranking]
  before_action :set_pagination_params, only: %w[ranking]

  def index
    index_service = Api::V1::Events::Index.call

    handle_response(index_service, :ok)
  end

  def show
    render json: @event, serializer: Api::V1::EventSerializer, status: :ok
  end

  def create
    create_service = Api::V1::Events::Create.call(events_params)

    handle_response(create_service, :created)
  end

  def update
    update_service = Api::V1::Events::Update.call(@event, events_params)

    handle_response(update_service, :ok)
  end

  def ranking
    ranking_service = Api::V1::Events::Ranking.call(@event, @page, @per_page)

    handle_response(ranking_service, :ok)
  end

  private

  def events_params
    params.require(:event)
          .permit(
            :name,
            :start_date,
            :end_date,
            :organization_id,
            :sport_id,
            :country,
            :active
          )
  end

  def fetch_event
    @event = Event.find_by(id: params[:id])
    render_error(I18n.t('errors.not_found')) unless @event
  end

  def set_pagination_params
    @per_page = params[:per_page]&.to_i || 10
    @page = params[:page]&.to_i || 1
  end

  def handle_response(service, status)
    if service.success?
      render_response(service.result, status)
    else
      render_unprocessable_entity_error(service.errors)
    end
  end
end

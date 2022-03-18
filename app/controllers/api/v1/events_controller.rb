# Events controller
class Api::V1::EventsController < ApplicationController
  before_action :fetch_event, only: %w[show update subscribe competitors ranking]
  before_action :fetch_user, only: %w[subscribe]
  before_action :set_pagination_params, only: %w[ranking]

  def index
    index_service = Api::V1::Events::Index.call

    handle_response(index_service, :ok)
  end

  def show
    render json: @event, status: :ok
  end

  def create
    create_service = Api::V1::Events::Create.call(events_params)

    handle_response(create_service, :created)
  end

  def update
    update_service = Api::V1::Events::Update.call(@event, events_params)

    handle_response(update_service, :ok)
  end

  def subscribe
    subscribe_service = Api::V1::Events::Subscribe.call(@event, @user)

    handle_response(subscribe_service, :ok)
  end

  def competitors
    competitors_list = @event.users.includes(:results)

    render json: competitors_list, each_serializer: Api::V1::CompetitorSerializer, event_id: @event.id, status: :ok
  end

  def ranking
    ranking_service = Api::V1::Events::Ranking.call(@event, @page, @per_page)

    handle_serialized_response(ranking_service, Api::V1::RankingSerializer, :ok)
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
            :active,
            :user_id
          )
  end

  def fetch_event
    @event = Event.find_by(id: params[:id])
    render_error(I18n.t('errors.not_found')) unless @event
  end

  def fetch_user
    @user = User.find_by(id: params[:user_id])
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

  def handle_serialized_response(service, serializer, status)
    if service.success?
      render_serialized_response(service.result, serializer, status)
    else
      render_unprocessable_entity_error(service.errors)
    end
  end
end

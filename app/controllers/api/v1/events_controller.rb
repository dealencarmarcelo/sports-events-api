# Events controller
class Api::V1::EventsController < ApplicationController
  before_action :fetch_event, only: %w[show]

  def index
    index_service = Api::V1::Events::Index.call

    render json: index_service.result,
           each_serializer: Api::V1::EventsSerializer,
           adapter: :json,
           status: :ok
  end

  def show
    render json: @event, serializer: Api::V1::EventsSerializer, status: :ok
  end

  def create
    create_service = Api::V1::Events::Create.call(events_params)

    if create_service.success?
      render json: create_service.result, serializer: Api::V1::EventsSerializer, status: :created
    else
      render json: { errors: create_service.errors }, status: :unprocessable_entity
    end
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
            :country
          )
  end

  def fetch_event
    @event = Event.find_by(id: params[:id])
    render json: { errors: 'not found' }, status: :not_found unless @event
  end
end

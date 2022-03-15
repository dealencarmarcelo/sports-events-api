# Results controller
class Api::V1::ResultsController < ApplicationController
  before_action :fetch_result, only: %w[show]

  def index
    index_service = Api::V1::Results::Index.call

    render json: index_service.result,
           each_serializer: Api::V1::ResultsSerializer,
           adapter: :json,
           status: :ok
  end

  def show
    render json: @result, serializer: Api::V1::ResultsSerializer, status: :ok
  end

  def create
    create_service = Api::V1::Results::Create.call(results_params)

    if create_service.success?
      render json: create_service.result, serializer: Api::V1::ResultsSerializer, status: :created
    else
      render json: { errors: create_service.errors }, status: :unprocessable_entity
    end
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
    render json: { errors: 'not found' }, status: :not_found unless @result
  end
end

class Api::V1::ResultsController < ApplicationController
  def index
    results = Result.all

    render json: results, status: :ok
  end
  
  def create
    result = Result.new(results_params)

    if result.save
      render json: result, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def results_params
    params.require(:result)
      .permit(
        :event_id,
        :participant_id,
        :unit,
        :value
      )
  end
end
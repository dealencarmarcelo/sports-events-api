class Api::V1::EventsController < ApplicationController
  def index
    events = Event.all

    render json: events, status: :ok
  end
  
  def create
    event = Event.new(events_params)

    if event.save
      render json: event, status: :created
    else
      render json: { errors: event.errors }, status: :unprocessable_entity
    end
  end

  private

  def events_params
    params.require(:event)
      .permit(
        :name,
        :start_date,
        :end_date,
        :host_id,
        :sport_id,
        :country
      )
  end
end

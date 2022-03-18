# Common API responses
module ApiCommonResponse
  extend ActiveSupport::Concern

  def render_response(data = {}, status = :ok)
    render json: data, status: status
  end

  def render_unprocessable_entity_error(resource = nil)
    data = verify_errors(resource)
    render json: data, status: :unprocessable_entity
  end

  def render_error(error)
    render json: error
  end

  private

  def verify_errors(resource)
    { errors: resource }
  end
end

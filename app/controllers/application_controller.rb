class ApplicationController < ActionController::API
  include ApiCommonResponse

  rescue_from ErrorHandler, with: :error_handler

  private

  def error_handler(error)
    data = I18n.t(error.message, scope: [:errors])

    data = I18n.t(:unknown, scope: [:errors]) if data.include?('translation missing')

    error_details = { code: data[:code], message: data[:message] }

    error_details[:field] = data[:field] if data[:field].present?

    render json: { errors: error_details }, status: data[:status]
  end
end

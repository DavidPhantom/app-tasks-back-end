# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  private

  def render_not_found_response(model)
    render json: {
      message: "#{model.model} not found",
      errors: { field: 'resource', code: 'not_found' }
    }, status: :not_found
  end

  def render_unprocessable_entity_response(exception)
    render json: {
      message: 'Unprocessable Entity',
      errors: ErrorsSerializer.new(exception.record).serialize
    }, status: :unprocessable_entity
  end
end

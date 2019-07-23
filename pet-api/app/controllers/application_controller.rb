class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found
    render json: { error: 'Not Found' }, status: :not_found
  end
end

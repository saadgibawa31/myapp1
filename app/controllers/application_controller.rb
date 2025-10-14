class ApplicationController < ActionController::Base

 rescue_from ActiveRecord::RecordNotFound, with: :show_record_errors 

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def show_record_errors(exception)
    # render json: { error: exception.message }, status: :not_found
    render 'errors/error', status: :not_found
    # message: "User not Found"
    # render "app/views/errors/error"

  end
end

class ApplicationController < ActionController::Base

 rescue_from ActiveRecord::RecordNotFound, with: :show_record_errors 

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user
  helper_method :user_signed_in?
  before_action :current_user
  # before_action :authenticate_user



  def current_user
    if session[:current_user_id]
      @current_user ||= User.find_by(id: session[:current_user_id])
  
    end
  end

  def user_signed_in?
    current_user.present?
  end

  # def authenicate_user
  #   redirect_to login_path, flash: {danger: 'You must be signed in'} if current_user.nil?
  # end

  # def redirect_if_authenticated
  #   redirect_to dashboard_index_path, flash: {info: 'You are already signed in'} if user_signed_in?
  # end



  private

  def show_record_errors(exception)
    # render json: { error: exception.message }, status: :not_found
    render 'errors/error', status: :not_found
    # message: "User not Found"
    # render "app/views/errors/error"

  end
end

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :authenticate_api_v1_user!

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render json: {data: {}, errors: {title: 'record not found'}}, status: 404
  end

  protected

end
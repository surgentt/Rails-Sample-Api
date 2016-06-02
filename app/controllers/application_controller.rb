class ApplicationController < ActionController::API
  # TODO: Need to figure out token authentication
  # before_action :authenticate_user!
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render json: {data: {}, errors: {title: 'record not found'}}, status: 404
  end

end

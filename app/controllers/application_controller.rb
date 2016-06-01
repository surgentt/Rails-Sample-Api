class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render json: {data: {}, errors: {status: 404, title: 'record not found'}}
  end

end

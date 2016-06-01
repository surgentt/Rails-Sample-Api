class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render json: {
             success: false,
             error: 'No record found'
           }, status: 404
  end

end

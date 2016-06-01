class UsersController < ApplicationController

  swagger_controller :users, 'Users'

  swagger_api :index do
    summary 'Fetches all users'
    response :unauthorized
    response :not_acceptable
  end

  def index
    render :json => {result:'Success'}, :status => 200
  end

  swagger_api :show do
    summary 'Fetches a User'
    param :path, :id, :integer, :required, 'User ID'
    response :unauthorized
    response :not_acceptable
  end

  def show
    render :json => {result:'Success'}, :status => 200
  end

end
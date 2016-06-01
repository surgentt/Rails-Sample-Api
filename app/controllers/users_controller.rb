class UsersController < ApplicationController

  swagger_controller :users, 'Users'

  swagger_api :index do
    summary 'Fetches all users'
    response :unauthorized
    response :not_acceptable
  end

  def index
    @users = User.all
    render json: {response: @users}, status: 200
  end

  swagger_api :show do
    summary 'Fetches a User'
    param :path, :id, :integer, :required, 'User ID'
    response :unauthorized
    response :not_acceptable
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {result: @user}, status: 200
    else
      render status: 406
    end
  end

end
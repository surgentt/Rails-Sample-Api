module Api
  module V1
    class UsersController < ApplicationController

      swagger_controller :users, 'Users'

      swagger_api :show do
        summary 'Fetches a User'
        param :path, :id, :integer, :required, 'User ID'
        response :unauthorized
        response :not_found
      end

      def show
        @user = User.find(params[:id])
        render json: {data: {user: @user}, errors: {}}, status: 200
      end

      ## Admin Only

      swagger_api :index do
        summary 'Fetches all users'
        response :unauthorized
      end

      def index
        @users = User.all
        render json: {data: {users: @users}, errors: {}}, status: 200
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

    end
  end
end
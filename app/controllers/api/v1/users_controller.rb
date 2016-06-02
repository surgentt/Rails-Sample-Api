module Api
  module V1
    class UsersController < ApplicationController

      swagger_controller :users, 'Users'

      swagger_api :create do
        summary 'Creates a new User'
        param :form, 'user[name]',     :string, :required, 'Full Name'
        param :form, 'user[email]',    :string, :required, 'Email address'
        param :form, 'user[password]', :string, :required, 'Password'
        param :form, 'user[password_confirmation]', :string, :required, 'Password Confirmation'
        response :not_acceptable
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: {data: {user: {email: user.email }}}, status: 201
        else
          warden.custom_failure!
          render json: {data: {errors: user.errors}}, status: 406
        end
      end

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
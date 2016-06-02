module Api
  module V1
    class OrdersController < ApplicationController

      swagger_controller :orders, 'Orders'

      swagger_api :index do
        summary 'Fetches all Orders for a User'
        param :path, :user_id, :integer, :required, 'User Id'
      end

      def index
        @user = User.find(params[:user_id])
        @orders = Order.all
        render json: {data: {orders: @orders}, errors: {}}, status: 200
      end

      swagger_api :create do
        summary 'Creates a new menu item'
        param :path, :user_id, :integer, :required, 'User Id'
        param :form, 'menu_item[address]', :string, :required, 'Title'
        response :created
        response :not_acceptable
      end

      def create
        @user = User.find(params[:user_id])
        @order = Order.new(order_params)
        @order.user = @user
        if @order.save
          render json: {data: {order: @order}}, status: 201
        else
          render json: {data: {errors: @order.errors}}, status: 406
        end
      end

      swagger_api :show do
        summary 'Fetches an Order'
        param :path, :user_id, :integer, :required, 'User ID'
        param :path, :id, :integer, :required, 'Order ID'
        response :unauthorized
        response :not_found
      end

      def show
        @order = Order.find(params[:id])
        render json: {data: {order: @order}, errors: {}}, status: 200
      end

      private

      def order_params
        params.require(:menu_item).permit(:address)
      end

    end
  end
end
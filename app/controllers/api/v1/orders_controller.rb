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
        summary 'Creates a New Menu Item'
        param :path, :user_id, :integer, :required, 'User Id'
        param :form, 'order[address]', :string, :required, 'Address'
        param :form, 'order[stripe_card_token]', :string, :required, 'Stripe Card Token'
        param :form, 'order[menu_items][]', :array, :required, 'Menu Item'
        response :created
        response :not_acceptable
      end

      def create
        @user = User.find(params[:user_id])
        @order = Order.new
        if @order.create_by_customer(order_params, @user)
          render json: {data: {order: @order, relationships: {menu_items: @order.menu_items}}}, status: 201
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
        render json: {data: {order: @order, relationships: {menu_items: @order.menu_items}}, errors: {}}, status: 200
      end

      private

      def order_params
        # Swagger method pulls data from the view like ['2,3']
        # Radio buttons on my other app return params like this. ["1", "2"]
        if params[:order][:menu_items].length == 1
          params[:order][:menu_items] = params[:order][:menu_items].first.split(',')
        end
        params.require(:order).permit(:address, :stripe_card_token, menu_items: [])
      end

    end
  end
end
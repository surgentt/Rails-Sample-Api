module Api
  module V1
    class MenuItemsController < ApplicationController

      swagger_controller :menu_items, 'Menu Items'

      swagger_api :index do
        summary 'Fetches all Menu Items'
      end

      def index
        @menu_items = MenuItem.all
        render json: {data: {menu_items: @menu_items}, errors: {}}, status: 200
      end

      swagger_api :create do
        summary 'Creates a new menu item'
        param :form, 'menu_item[title]', :string, :required, 'Title'
        param :form, 'menu_item[description]', :string, :required, 'Description'
        param :form, 'menu_item[price_in_cents]', :integer, :required, 'Price in cents'
        response :created
        response :not_acceptable
      end

      def create
        @menu_item = MenuItem.new(menu_item_params)
        if @menu_item.save
          render json: {data: {menu_item: @menu_item}}, status: 201
        else
          render json: {data: {errors: @menu_item.errors}}, status: 406
        end
      end

      swagger_api :show do
        summary 'Fetches a Menu Item'
        param :path, :id, :integer, :required, 'Menu ID'
        response :unauthorized
        response :not_found
      end

      def show
        @menu_item = MenuItem.find(params[:id])
        render json: {data: {menu_item: @menu_item}, errors: {}}, status: 200
      end

      swagger_api :update do
        summary 'Updates an existing Menu Item'
        param :path, :id, :integer, :required, 'Menu Item'
        param :form, :title, :string, :optional, 'Title'
        param :form, :description, :string, :optional, 'Description'
        param :form, :price_in_cents, :string, :optional, 'Price in Cents'
        response 204, 'Updated'
        response :unauthorized
        response :not_found
        response :not_acceptable
      end

      def update
        @menu_item = MenuItem.find(params[:id])
        if @menu_item.update(menu_item_params)
          render json: {data: {menu_item: @menu_item}, errors: {}}, status: 204
        else
          render json: {data: {errors: @menu_item.errors}}, status: 406
        end
      end

      swagger_api :destroy do
        summary 'Deletes an existing Menu item'
        param :path, :id, :integer, :required, 'Menu Id'
        response 204, 'Deleted'
        response :unauthorized
        response :not_found
      end

      def destroy
        @menu_item = MenuItem.find(params[:id]).destroy
        render json: {data: {menu_item: @menu_item}, errors: {}}, status: 204
      end

      private

      def menu_item_params
        params.require(:menu_item).permit(:title, :description, :price_in_cents)
      end

    end
  end
end
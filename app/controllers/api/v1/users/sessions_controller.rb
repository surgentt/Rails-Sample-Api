class Api::V1::Users::SessionsController < Devise::SessionsController

  swagger_controller :sessions, 'Sessions', resource_path: 'auth'

  swagger_api :create do
    summary 'Signs in a User'
    param :form, :email,    :string, :required, 'Email address'
    param :form, :password, :string, :required, 'Password'
    response :not_acceptable
  end

  def create
    super
  end

  def destroy
    super
  end

end
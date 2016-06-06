class Api::V1::Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :authenticate_user!
  before_action :configure_sign_up_params, only: [:create]

  swagger_controller :registrations, 'Registrations', resource_path: 'auth'

  swagger_api :create do
    summary 'Creates a new User'
    param :form, :name,     :string, :required, 'Full Name'
    param :form, :email,    :string, :required, 'Email address'
    param :form, :password, :string, :required, 'Password'
    param :form, :password_confirmation, :string, :required, 'Password Confirmation'
    response :not_acceptable
  end

  def create
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end

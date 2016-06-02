module Api
  module V1
    class Custom::RegistrationsController < DeviseTokenAuth::RegistrationsController

      # TODO: The following is getting pulled through. Unsure why
      swagger_controller :registrations, 'Registrations'

      swagger_api :create do
        summary 'Creates a new User'
        param :form, 'user[name]',     :string, :required, 'Full Name'
        param :form, 'user[email]',    :string, :required, 'Email address'
        param :form, 'user[password]', :string, :required, 'Password'
        param :form, 'user[password_confirmation]', :string, :required, 'Password Confirmation'
        response :not_acceptable
      end

      def create
        super
      end

      private

    end
  end
end
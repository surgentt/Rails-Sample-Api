module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController

      # TODO: The following is not getting pulled through. Unsure why

      swagger_controller :registrations, 'Registrations', resource_path: 'auth'

      swagger_api :create do
        binding.pry
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
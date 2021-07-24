module Api
  module V1
    class ApiController < ActionController::API
      # before_action :check_basic_auth
      # skip_before_action :verify_authenticity_token
      rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
      #rescue_from catch all exceptions
      #rescue_from User::NotAuthorized, :with => :user_not_authorized

      private

      def check_basic_auth
        unless request.authorization.present?
          head :unauthorized
          return
        end

        authenticate_with_http_basic do |email, password|
        user = User.find_by(email: email.downcase)
          if user && user.authenticate(password)
            @current_user = user
          else
            head :unauthorized
          end
        end
      end

      def current_user
        @current_user
      end

      def record_not_found
        head :not_found
      end

      def internal_server_error
        head :internal_server_error
      end

      #def user_not_authorized
      #  flash[:error] = "You don't have access to this section."
      #  redirect_to :back
      #end

    end
  end
end
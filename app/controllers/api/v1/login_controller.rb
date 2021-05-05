module Api
  module V1
    class LoginController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        p params.require(:name).inspect
        p params.require(:password).inspect
        p params.require(:email).inspect

      end

      private

      def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end

module Api
  module V1
    class UsersController < ApplicationController
      has_secure_password
      def index ;end

      def show
        render json: User.all
      end
    end
  end
end

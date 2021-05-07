module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.last(10)
      end

      def show
        render json: User.all
      end

      def show_user
        render json: User.limit(5).find(params[:id])
      end

      def create
        user = User.new(user_params)

        if user.save.persisted?
          render json: user, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if User.find(params[:id]).destroy.destroyed?
          head :no_content
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def edit
        if User.update_attributes(user_params)
          render json: user, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def login
        user = User.find_by(email: params[:user][:email])
        if user & user.authenticate(params[:user][:password])
          render json: { status: :success }, status: :ok
        else
          render json: user.errors, status: 400
        end
      end

      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
    end
  end
end

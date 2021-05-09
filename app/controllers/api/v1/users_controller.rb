module Api
  module V1
    class UsersController < ApplicationController
      #before_action :authenticate

      def index
        render json: User.last(10)
      end

      def show
        render json: User.all
      end

      def show_user
        user = User.limit(5).find_by(id: params[:id])
        return render json: { errors: 'user not found' } unless user

        render json: user
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: { success: true, user: user } # status: :created
        else
          #user = User.find(params[:name])
          render json: { error: user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        if User.find_by(id: params[:id]).destroy
          head :no_content
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end

      def edit
        if User.update_attributes(user_params)
          render json: user, status: :created
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end

      def login
        user = User.find_by(email: params[:user][:email])
        if user & user.authenticate(params[:user][:password])
          render json: { success: true }, status: :ok
        else
          render json: user.errors.full_messages, status: 400
        end
      end

      def user_params
        params.permit(:name, :email)
      end
    end
  end
end

module Api
  module V1
    class UsersController < ApplicationController
      def index; end

      def show
        render json: User.all
      end

      def show_user
        render json: User.limit(5).find(params[:id])
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :ok
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        User.find(params[:id]).destroy!
        head :no_content
      end

      def edit
        if User.update_attributes(user_params)
          render json: user, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def login
        if User.find_by(email: params[:email])
          render json: user, status: :ok
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def user_params
        params.require(:user).permit(:name, :email, :password)
      end




    end
  end
end

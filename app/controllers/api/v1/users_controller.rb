module Api
  module V1
    class UsersController < ApplicationController
      def index
        index = User.last(10)
        render json: UserBlueprint.render(index)    #{ success: true, user: index.as_json }
      end

      def show
        user = User.find_by(id: params[:id])
        render json: UserBlueprint.render(user)   #{ success: true, user: user.as_json }
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: UserBlueprint.render(user)   #{ success: true, user: user.as_json }
        else
          render json: { user: 'not unauthorized' }, status: :unauthorized
        end
      end

      def destroy
        if User.find_by(id: params[:id])&.destroy
          render json: { success: true }
        else
          render json: { user: 'not found' }, status: :unprocessable_entity
        end
      end

      def update
        user = User.find_by(id: params[:id])
        if user
          user.update(user_params)
          render json: UserBlueprint.render(user), status: :ok  #{ success: true },
        else
          render json: {  user: 'forbidden' }, status: :forbidden
        end
      end

      def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          render json: UserBlueprint.render(user), status: :ok     #{ success: true }
        else
          render json: { user: 'not found' }, status: 400
        end
      end

      def user_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end

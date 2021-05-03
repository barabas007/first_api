class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @usrer = User.new
  end
  def index
    render json: User.all
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
end

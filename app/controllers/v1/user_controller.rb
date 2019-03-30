class V1::UserController < ApplicationController

  # get-all-users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # create-user
  def create
    @user = User.new(user_params)
    @user.save
    render json: @user, status: :created
  end

  def destroy
    @user = User.where(id: params[:id]).first
    if @user.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end

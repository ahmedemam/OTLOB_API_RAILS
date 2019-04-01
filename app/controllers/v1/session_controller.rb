class V1::SessionController < ApplicationController

  # sign-in
  def create
    user = User.where(email: params[:email]).first
    if user.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email]), status: :created
    else
      head(:unauthorized)
    end
  end

  #sign-out
  def destroy

  end

end

class V1::SessionController < ApplicationController

  # sign-in
  def login
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    @user = user_email.present? && User.find_by(email: user_email)
    if @user.valid_password? user_password
      # render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
      render :create, status: :created
    else
      head(:unauthorized)
      @response = {message: "unauthorized user"}
      render json: @response
    end
  end

  #sign-out
  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
end

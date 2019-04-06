class V1::FriendController < ApplicationController
  before_action :set_todo
  def create_friend
    user = User.find(params[:user_id])
    begin
      fr = User.find_by(email: params[:email])
      friendid = fr['id']
      #   User.create_with(last_name: 'Johansson').find_or_create_by(first_name: 'Scarlett')
      #   fr= User.find_by(email:params[:email])
      @fr2 = user.friends.create_with(email: params[:email], friend_id: friendid).find_or_create_by(email: fr['email'])
      render json: @fr2, status: :ok
    rescue Exception => e
      render json: {status: 'friend email dont exist'}, status: :ok
      #fr2=  user.friends.create_with(email:params[:email]).find_or_create_by(email:fr['email'])
    end
  end

  # def get_friend
  #     user = User.find(params[:user_id])
  #    friendData= user.friends.find()
  #     render json: user['friends'][0], status: :ok
  # end

  def delete_friend
    user = User.find(params[:user_id])
    deleted = user.friends.find(params[:friend_id]).destroy
    render json: deleted, status: :ok
  end

  private
  def friend_params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

end

class V1::FriendController < ApplicationController
  before_action :set

  private

  def friend_params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

end

class V1::GroupController < ApplicationController

    def get_groups
        user = User.find(params[:user_id])
        groups = user.groups.all
        render json: groups, status: :ok
  end

  def create_group
    user = User.find(params[:user_id])
    usergroup =   user.groups.find_or_create_by!({
               name:params[:name]
                
              })
            
    render json: usergroup, status: :ok
  end

  def update_group
     user = User.find(params[:user_id])
            user.groups.find(params[:group_id]).update!({
              name: params[:name]})
     render json: user, status: :ok

  end

  def delete_group
     user = User.find(params[:user_id])
            user.groups.find(params[:group_id]).destroy
    render json: user, status: :ok
        
  end

  def add_friend_to_group
     user = User.find(params[:user_id])
            group = user.groups.find(params[:group_id])
            group.friends.create!(friend_id:params[:friend_id]);

     render json: user, status: :ok
     

  end




end

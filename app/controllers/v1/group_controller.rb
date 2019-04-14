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

  def get_one_group
    user = User.find(params[:user_id])
    group=user.groups.find(params[:group_id])
    friendsid=group['friends'];
    data=friendsid.map{|friend|user.friends.find(friend['friend_id'])};
    data.push({name:group.name,_id:group._id});

    render json: data, status: :ok
  end
  



  def get_one_group1 ( user_id,group_id)
    user = User.find(user_id)
    group=user.groups.find(group_id)
    friendsid=group['friends'];
    data=friendsid.map{|friend|user.friends.find(friend['friend_id'])};
    data.push({name:group.name,_id:group._id});

    render json: data, status: :ok
  end
  def add_friend_to_group2
     user = User.find(params[:user_id])
            group = user.groups.find(params[:group_id])
            group.friends.create!(friend_id:params[:friend_id]);

     render json: user, status: :ok
     

  end

  def add_friend_to_group
    user = User.find(params[:user_id])
           group = user.groups.find(params[:group_id])
           frnds=user.friends.find_by(friend_id:params[:friend_id])
           friend=group.friends.create!(friend_id:params[:friend_id],name:frnds.name,email:frnds.email);
          # friendData=user.friends.find(params[:friend_id])
    render json: friend, status: :ok
    

 end



end

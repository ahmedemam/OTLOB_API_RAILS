class V1::OrderController < ApplicationController

  def get_orders
    user = User.find(params[:user_id])
    @orders = user.orders.all
    render json: @orders, status: :ok
  end

  def create_order
    user = User.find(params[:user_id])
    userorder = user.orders.find_or_create_by!({
                                                   name: params[:name],
                                                   restaurantName: params[:restaurantName],
                                                   menuImage: params[:menuImage],
                                                   status: params[:status],
                                                   totalPrice: params[:totalPrice]

                                               })
    render json: userorder, status: :ok
  end

  def update_order
    user = User.find(params[:user_id])
    updatedorder = user.orders.find(params[:order_id]).update!({
                                                                   name: params[:name],
                                                                   restaurantName: params[:restaurantName],
                                                                   menuImage: params[:menuImage],
                                                                   status: params[:status]


                                                               })

    render json: updatedorder, status: :ok
  end

  def update_status
    user = User.find(params[:user_id])
    myorder = user.orders.find(params[:order_id])
    name = myorder["name"];
    restaurantName = myorder["restaurantName"]
    menuImage = myorder["menuImage"]
    statusupdated = user.orders.find(params[:order_id]).update!({
       name: name,
       restaurantName: restaurantName,
       menuImage: menuImage,
       status: params[:status]  })
    render json: statusupdated, status: :ok

   end



def get_order_by_id

  
     user = User.find(params[:user_id])
    speceficOrder= user.orders.find(params[:order_id])
     render json: speceficOrder, status: :ok


end


def delete_order
  
     user = User.find(params[:user_id])
     deleted_Order=user.orders.find(params[:order_id]).destroy
     render json: deleted_Order, status: :ok

end
def add_friend_to_order

      user = User.find(params[:user_id])
      myorder=user.orders.find(params[:order_id])
      fr=myorder.add_to_set(members:[params[:friend_id]]);
      render json: fr, status: :ok

end


def delete_friend_from_order

 
    user = User.find(params[:user_id])
    myorder=user.orders.find(params[:order_id])
    delFr=myorder.pull(members:params[:friend_id])
    render json: delFr, status: :ok
    
  
end

def get_member_of_order

    
        user = User.find(params[:user_id])
        myorder=user.orders.find(params[:order_id])
       mem= myorder["members"]
       render json: mem, status: :ok
       
end

def add_group_to_order
   
        
          user = User.find(params[:user_id])
          myorder=user.orders.find(params[:order_d])
          
       added= myorder.add_to_set(membergroup:[params[:group_id]])
       render json: added, status: :ok
end

def delete_group_from_order
    
 
        user = User.find(params[:user_id])
        myorder=user.orders.find(params[:order_id])
        deleted=myorder.pull(membergroup:params[:group_id])
        render json: deleted, status: :ok
        
end

def get_group_from_order


  user = User.find(params[:user_id])
  myorder=user.orders.find(params[:order_id])
  g=user.groups.find(params[:group_id])
  render json: g, status: :ok


  end

end
end

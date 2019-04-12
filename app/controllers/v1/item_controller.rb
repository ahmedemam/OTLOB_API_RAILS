class V1::ItemController < ApplicationController
    def get_items_of_order

            user = User.find(params[:user_id])
            myorder=user.orders.find(params[:order_id])
            itemsAll=myorder.items.all
            render json: itemsAll, status: :ok
         
    end

    def delete_order_item
       
          user = User.find(params[:user_id])
        myorder=user.orders.find(params[:order_id])
        myitem=myorder.items.find(params[:item_id])
         des= myitem.destroy
          render json: des, status: :ok
      
    end
    def create_item

        user = User.find(params[:user_id])
  myorderitem=user.orders.find(params[:order_id])
             myorder.items.find_or_create_by!(
              comment: params[:comment],
              amount: params[:amount],
              price: params[:price],
              name:params[:name],
              friend_id:params[:friend_id]
            )
            render json:  myorderitem, status: :ok
        
    end
    def update_item
        
            user = User.find(params[:user_id])
             myorder=user.orders.find(params[:order_id])
            myitem=myorder.items.find(params[:item_id])
            myitUpdate=myitem.update!(
              comment: params[:comment],
              amount: params[:amount],
              price: params[:price],
              name:params[:name],
              friend_id:params[:friend_id]
            )
            render json:  myitUpdate, status: :ok
         
    end
end

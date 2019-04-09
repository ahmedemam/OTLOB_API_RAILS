class V1::ItemController < ApplicationController
    def get_items_of_order

            user = User.find(params[:user_id])
            myorder=user.orders.find(params[:order_id])
            itemsAll=myorder.items.all
            render json: itemsAll, status: :ok
         
    end
end

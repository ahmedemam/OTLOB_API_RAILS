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
                                                                    status: params[:status]


                                                                })
    render json: statusupdated, status: :ok
  end
end

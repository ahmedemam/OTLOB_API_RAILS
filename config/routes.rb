Rails.application.routes.draw do
  # devise_for :users
  namespace :v1, defaults: {format: :json} do
    #########################

    post "/user" => "user#create"
    get "/user" =>"user#index"
    # post "/user/login" =>"session#create"
   get "/user/:user_id/friend" => "friend#get_friend"
   post "/user/:user_id/friend" => "friend#create_friend"
   delete "/user/:user_id/friend/:friend_id" => "friend#delete_friend"
   ###############################
   
   get "/user/:user_id/order" => "order#get_orders"
   post "/user/:user_id/order" => "order#create_order"
   put  "/user/:user_id/order/:order_id" => "order#update_order"
   put  "/user/:user_id/order/:order_id/status" => "order#update_status"
   get "/user/:user_id/order/:order_id" => "order#get_order_by_id"
   put  "/user/:user_id/order/:order_id/friend/:friend_id" => "order#add_friend_to_order"
   put  "/user/:user_id/order/:order_id/group/:group_id" => "order#add_group_to_order"
   delete  "/user/:user_id/order/:order_id/group/:group_id" => "order#delete_group_from_order"

  ####################
    # resources :user do
    #   resources :friend
    # end
    # resources :user, only:[:index]
    resources :session, only: [:create, :destroy]
    
  end

end

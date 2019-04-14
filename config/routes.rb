Rails.application.routes.draw do

###############
# mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
# post 'auth/request', to:'authorization#get_authorization'
###############

  # devise_for :users
  namespace :v1, defaults: {format: :json} do
    #########################

    post "/user" => "user#create"
    get "/user" =>"user#index"

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
   delete  "/user/:user_id/order/:order_id/item/:item_id" => "item#delete_order_item"
   post  "/user/:user_id/order/:order_id/items/:friend_id" => "item#create_item"
   get  "/user/:user_id/order/:order_id/items" => "item#get_items_of_order"
   put  "/user/:user_id/order/:order_id/friend/:friend_id/items/:item_id" => "item#update_item"
   ####################
  get "/user/:user_id/group" => "group#get_groups"
  get "/user/:user_id/group/:group_id" => "group#get_one_group"
   post "/user/:user_id/group" => "group#create_group"
   put "/user/:user_id/group/:group_id" => "group#update_group"
   delete  "/user/:user_id/group/:group_id" => "group#delete_group"
   post "/user/:user_id/group/:group_id/friend/:friend_id/" => "group#add_friend_to_group"


  ####################
    # resources :user do
    #   resources :friend
    # end
    # resources :user, only:[:index]
    resources :session, only: [:create, :destroy]
    
  end

end

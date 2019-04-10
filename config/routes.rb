Rails.application.routes.draw do
  # devise_for :users
  namespace :v1, defaults: {format: :json} do
    #########################
  get "/user/:user_id/friend" => "friend#get_friend"
  post "/user/:user_id/friend" => "friend#create_friend"
  delete "/user/:user_id/friend/:friend_id" => "friend#delete_friend"
  ###############################
  get "/user/:user_id/order" => "order#get_orders"
  post "/user/:user_id/order" => "order#create_order"
  put  "/user/:user_id/order/:order_id" => "order#update_order"
  put  "/user/:user_id/order/:order_id/status" => "order#update_status"
  post "/user" => "user#create"
  get "/user" => "user#index"



  ####################
    resources :user do
      resources :friend

    end
    resources :user
    resources :session, only: [:create, :destroy]
    
  end

end

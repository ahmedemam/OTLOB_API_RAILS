json.data do
  json.user do
    json.call(
        @user,
        :_id,
        :email,
        :authentication_token
    )
  end
end
json.array!(@users) do |user|
  json.extract! user, :id, :name, :about, :phone, :email, :encrypted_password
  json.url user_url(user, format: :json)
end

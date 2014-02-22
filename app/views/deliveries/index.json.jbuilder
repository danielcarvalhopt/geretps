json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :description, :public, :grades, :phase_id, :group_id, :statement_id
  json.url delivery_url(delivery, format: :json)
end

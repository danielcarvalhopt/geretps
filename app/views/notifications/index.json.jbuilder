json.array!(@notifications) do |notification|
  json.extract! notification, :id, :title, :body, :date, :project_id
  json.url notification_url(notification, format: :json)
end

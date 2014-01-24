json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :user_id
  json.url teacher_url(teacher, format: :json)
end

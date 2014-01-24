json.array!(@students) do |student|
  json.extract! student, :id, :identifier, :user_id
  json.url student_url(student, format: :json)
end

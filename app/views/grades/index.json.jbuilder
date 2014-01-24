json.array!(@grades) do |grade|
  json.extract! grade, :id, :value, :comments, :delivery_id, :student_id
  json.url grade_url(grade, format: :json)
end

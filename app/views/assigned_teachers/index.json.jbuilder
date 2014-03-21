json.array!(@assigned_teachers) do |assigned_teacher|
  json.extract! assigned_teacher, :id, :teacher_id, :subject_id
  json.url assigned_teacher_url(assigned_teacher, format: :json)
end

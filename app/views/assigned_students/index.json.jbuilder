json.array!(@assigned_students) do |assigned_student|
  json.extract! assigned_student, :id, :student_id, :subject_id, :shift_id
  json.url assigned_student_url(assigned_student, format: :json)
end

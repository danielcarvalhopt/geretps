puts 'seeding assigned students...'

assigned_students = [
  {
    student_id: 1,
    subject_id: 1,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 1,
    accepted: true
  },
  {
    student_id: 3,
    subject_id: 1,
    accepted: true
  },
  {
    student_id: 4,
    subject_id: 1,
    accepted: true
  },
  {
    student_id: 5,
    subject_id: 1,
    accepted: true
  },
]

assigned_students.each do |assigned_student|
  AssignedStudent.where(assigned_student).first_or_create!
end

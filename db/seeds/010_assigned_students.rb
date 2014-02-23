puts 'seeding assigned students...'

assigned_students = [
  {
    student_id: 2,
    subject_id: 1
  },
  {
    student_id: 2,
    subject_id: 2
  },
  {
    student_id: 2,
    subject_id: 3
  },
  {
    student_id: 2,
    subject_id: 4
  },
  {
    student_id: 2,
    subject_id: 5
  },
  {
    student_id: 2,
    subject_id: 6
  },
  {
    student_id: 2,
    subject_id: 7
  },
  {
    student_id: 2,
    subject_id: 8
  },
  {
    student_id: 2,
    subject_id: 9
  }
]

assigned_students.each do |assigned_student|
  AssignedStudent.where(assigned_student).first_or_create!
end

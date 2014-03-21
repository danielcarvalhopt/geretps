puts 'seeding assigned teachers...'

assigned_teachers = [
  {
    teacher_id: 1,
    subject_id: 1
  },
  {
    teacher_id: 1,
    subject_id: 2
  },
  {
    teacher_id: 1,
    subject_id: 3
  },
  {
    teacher_id: 1,
    subject_id: 4
  },
  {
    teacher_id: 1,
    subject_id: 5
  },
  {
    teacher_id: 1,
    subject_id: 6
  },
  {
    teacher_id: 1,
    subject_id: 7
  },
  {
    teacher_id: 1,
    subject_id: 8
  },
  {
    teacher_id: 1,
    subject_id: 9
  }
]

assigned_teachers.each do |assigned_teacher|
  AssignedTeacher.where(assigned_teacher).first_or_create!
end

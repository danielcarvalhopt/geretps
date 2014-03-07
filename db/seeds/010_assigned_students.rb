puts 'seeding assigned students...'

assigned_students = [
  {
    student_id: 1,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 3,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 4,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 5,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 6,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 7,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 8,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 9,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 10,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 11,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 12,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 13,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 14,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 15,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 16,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 17,
    subject_id: 5,
    accepted: true
  },
  {
    student_id: 1,
    subject_id: 2
  },
  {
    student_id: 1,
    subject_id: 3
  },
  {
    student_id: 1,
    subject_id: 4
  },
  {
    student_id: 1,
    subject_id: 5
  },
  {
    student_id: 1,
    subject_id: 2
  },
  {
    student_id: 1,
    subject_id: 3
  },
  {
    student_id: 1,
    subject_id: 4
  },
  {
    student_id: 1,
    subject_id: 5
  },
  {
    student_id: 1,
    subject_id: 6
  },
  {
    student_id: 1,
    subject_id: 7
  },
  {
    student_id: 1,
    subject_id: 8
  },
  {
    student_id: 1,
    subject_id: 9
  },
  {
    student_id: 2,
    subject_id: 1,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 2,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 3,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 4,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 6,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 7,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 8,
    accepted: true
  },
  {
    student_id: 2,
    subject_id: 9,
    accepted: true

  }
]

assigned_students.each do |assigned_student|
  AssignedStudent.where(assigned_student).first_or_create!
end

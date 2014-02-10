puts 'seeding courses...'

courses = [
    {
      name: "Computer Engineering",
      institution_id: 5
    },
    {
      name: "Formal Language Engineering",
      institution_id: 5
    }
]

courses.each do |course|
  Course.where(course).first_or_create!
end

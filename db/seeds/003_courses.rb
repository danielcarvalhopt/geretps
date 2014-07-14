puts 'seeding courses...'

courses = [
    {
      name: "Licenciatura em Engenharia Informática",
      institution_id: 13
    },
    {
      name: "Mestrado em Engenharia Informática",
      institution_id: 5
    }
]

courses.each do |course|
  Course.where(course).first_or_create!
end

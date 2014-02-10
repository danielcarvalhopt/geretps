puts 'seeding subjects...'

subjects = [
    {
      name: "Web Engineering",
      academic_year: "2013/2014", 
      course_id: 2,
      responsible_id: 1
    },
    {
      name: "Imperative Programming",
      academic_year: "2013/2014", 
      course_id: 1,
      responsible_id: 1
    },
    {
      name: "Formal Language Processing",
      academic_year: "2013/2014", 
      course_id: 1,
      responsible_id: 1
    }
]

subjects.each do |subject|
  Subject.where(subject).first_or_create!
end

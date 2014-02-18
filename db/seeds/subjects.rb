puts 'seeding subjects...'

subjects = [
    {
      name: "Engenharia Web",
      academic_year: "2013/2014", 
      course_id: 2,
      responsible_id: 1
    },
    {
      name: "Programação Imperativa",
      academic_year: "2013/2014", 
      course_id: 1,
      responsible_id: 1
    },
    {
      name: "Scripting para Processamento de Linguagens Naturais",
      academic_year: "2013/2014", 
      course_id: 1,
      responsible_id: 1
    }
]

subjects.each do |subject|
  Subject.where(subject).first_or_create!
end

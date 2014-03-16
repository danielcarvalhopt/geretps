puts 'seeding subjects...'

subjects = [
    {
      name: "Projecto Integrado",
      academic_year_id: 5,
      course_id: 1,
      responsible_id: 1
    },    
    {
      name: "Análise matemática",
      academic_year_id: 5,
      course_id: 1,
      responsible_id: 1
    },    
    {
      name: "Cálculo",
      academic_year_id: 5,
      course_id: 1,
      responsible_id: 1
    },    
    {
      name: "Processamento de Linguagens",
      academic_year_id: 5,
      course_id: 1,
      responsible_id: 1
    },
]

subjects.each do |subject|
  Subject.where(subject).first_or_create!
end

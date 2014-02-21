puts 'seeding subjects...'

subjects = [
    {
      name: "Análise e Transformação de Software",
      academic_year_id: 4,
      course_id: 2,
      responsible_id: 1
    },
    {
      name: "Engenharia Gramatical",
      academic_year_id: 4, 
      course_id: 2,
      responsible_id: 1
    },
    {
      name: "Processamento Estruturado de Documentos",
      academic_year_id: 4, 
      course_id: 2,
      responsible_id: 1
    },
    {
      name: "Scripting no Processamento de Linguagem Natural",
      academic_year_id: 4, 
      course_id: 2,
      responsible_id: 1
    },
    {
      name: "Processamento Estruturado de Documentos",
      academic_year_id: 4, 
      course_id: 1,
      responsible_id: 1
    },
    {
      name: "Processamento Estruturado de Documentos",
      academic_year_id: 4, 
      course_id: 1,
      responsible_id: 1
    }
]

subjects.each do |subject|
  Subject.where(subject).first_or_create!
end

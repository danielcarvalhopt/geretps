puts 'seeding subjects...'

subjects = [
    {
      name: "Análise e Transformação de Software",
      academic_year_id: 5,
      course_id: 2,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Engenharia Gramatical",
      academic_year_id: 5,
      course_id: 2,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Processamento Estruturado de Documentos",
      academic_year_id: 5,
      course_id: 2,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Scripting no Processamento de Linguagem Natural",
      academic_year_id: 5,
      course_id: 2,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Projecto Integrado",
      academic_year_id: 5,
      course_id: 2,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Laboratórios de Informática IV",
      academic_year_id: 4,
      course_id: 1,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Laboratórios de Informática III",
      academic_year_id: 3,
      course_id: 1,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Laboratórios de Informática II",
      academic_year_id: 2,
      course_id: 1,
      responsible_id: 1,
      student_ids: 1..3
    },
    {
      name: "Laboratórios de Informática I",
      academic_year_id: 1,
      course_id: 1,
      responsible_id: 1
    }
]

subjects.each do |subject|
  Subject.where(name: subject[:name]).first_or_initialize.tap do |s|
    s.academic_year = AcademicYear.find(subject[:academic_year_id])
    s.course = Course.find(subject[:course_id])
    s.responsible = Teacher.find(subject[:responsible_id])

    if subject[:student_ids]
      subject[:student_ids].each do |student_id|
      s.students << Student.find(student_id)
      end
    end
    s.save!
  end
end

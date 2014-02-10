require "open-uri"
puts 'seeding projects...'

projects = [
    {
      name: "GereTPs",
      description: "Projecto sobre gestão de projectos, unidades curriculares, turnos e alunos." ,
      begin_date: Time.now,
      end_date: nil,
      public: false,
      grades: false,
      open: false,
      max_elems: 3,
      min_elems: 1,
      subject_id: 1,
      statement_id: 1
    }
]

projects.each do |project|
  Project.where(project).first_or_create! 
end

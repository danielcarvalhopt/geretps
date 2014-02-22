require "open-uri"
puts 'seeding projects...'

projects = [
    {
      name: "AAA - Arquivo Aberto de trabalhos de Alunos",
      description: "Neste projecto pretende-se que os alunos desenvolvam uma aplicação Web que implemente um repositório digital de trabalhos de alunos. Além de permitir o livre acesso e pesquisa a todos os trabalhos depositados o sistema deverá assistir na execução dos workflows de realização e implementação de cada trabalho tornando necessária a criação de um backoffice que permita a gestão de disciplinas, alunos, grupos de trabalho, etc." ,
      begin_date: Date.new(2013,11,18),
      end_date: Date.new(2014,5,5),
      public: true,
      grades: false,
      open: true,
      max_elems: 3,
      min_elems: 1,
      subject_id: 1,
      statement_id: 1
    }
]

projects.each do |project|
  Project.where(project).first_or_create! 
end

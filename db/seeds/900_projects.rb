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
    },
    {
      name: "Projecto Integrado - GereTPs",
      description: "Neste projecto pretende-se que os alunos desenvolvam um Gestor de Trabalhos Práticos (GereTPs), que premita fazer a gestão de todos os trabalhos de uma disciplina. O GereTPs deverá ser responsável pela gestão da equipa docente, turnos e avaliação de uma disciplina",
      begin_date: Date.new(2013,10,13),
      end_date: Date.new(2014,7,14),
      public: false,
      grades: false,
      open: true,
      max_elems: 3,
      min_elems: 1,
      subject_id: 5,
      statement_id: 1
    },
    {
      name: "myAcademia - Gestor de Currículos Académicos",
      description: "Neste projecto pretende-se criar um gestor de currículos académicos (CVs), que passaremos a designar por myAcademia. O projeto consistirá no desenvolvimento de um sistema de informação que permita gerir os dados curriculares de um docente universitário.",
      begin_date: Date.new(2013,11,29),
      end_date: Date.new(2014,7,14),
      public: false,
      grades: false,
      open: true,
      min_elems: 1,
      max_elems: 3,
      subject_id: 3,
      statement_id: 5
    },
    {
      name: "Ficha de avaliação nº2",
      begin_date: Date.today,
      public: false,
      open: false,
      grades: false,
      min_elems: 1,
      max_elems: 3,
      subject_id: 2,
      statement_id: 3
    },
    {
      name: "Projeto",
      description: "Pretende-se criar uma pequena aplicação em Haskell que faça parsing de um ficheiro CSV que contém as inscrições das JOIN(Jornadas de Informática da Universidade do Minho) e que gere crachas para os diferentes tipos de participantes. A aplicação criada deverá também geras estatísticas sobre as inscrições.",
      begin_date: Date.new(2010,11,19),
      end_date: Date.new(2011,1,8),
      public: true,
      open: true,
      grades: true,
      min_elems: 1,
      max_elems: 3,
      subject_id: 9,
      statement_id: 9,
      shift_group: true
    },
    {
      name: "Projecto",
      description: "O objectivo do projecto é criar uma ferramenta de disposição de peças rectangulares sujeitas a várias restrições que permita ao utilizador colocar as peças na área de trabalho e verificar se todas as restrições são cumpridas. Adicionalmente, deveria ser possível pedir ao sistema para gerar soluções válidas ou mesmo encontrar a melhor solução possível.",
      begin_date: Date.new(2011,3,6),
      end_date: Date.new(2011,6,1),
      public: true,
      open: true,
      grades: true,
      min_elems: 1,
      max_elems: 3,
      subject_id: 8,
      statement_id: 8,
      shift_group: true
    },
    {
      name: "Projecto C - TransitáriosLEI",
      description: "Pretende-se criar uma aplicação informática para a empresa Transitários LEI, que faça a gestão de camiões, localidades e clientes.",
      begin_date: Date.new(2012,3,5),
      end_date: Date.new(2012,4,15),
      public: true,
      open: true,
      grades: true,
      min_elems: 1,
      max_elems: 3,
      subject_id: 7,
      statement_id: 7
    },
    {
      name: "Projecto",
      description: "Pretende-se criar uma aplicação web, com recurso a ferramentas Microsoft",
      begin_date: Date.new(2013,2,25),
      end_date: Date.new(2013,6,5),
      public: true,
      open: true,
      grades: true,
      min_elems: 3,
      max_elems: 5,
      subject_id: 6,
      statement_id: 6,
      shift_group: true
    },
    {
      name: "Ficha de avaliação nº1",
      begin_date: Date.new(2013,12,17),
      end_date: Date.new(2014,1,12),
      public: false,
      open: true,
      grades: true,
      min_elems: 1,
      max_elems: 3,
      subject_id: 2,
      statement_id: 2
    }
]

projects.each do |project|
  Project.where(project).first_or_create!
end

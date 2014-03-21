require "open-uri"
puts 'seeding projects...'

projects = [
    {
      name: "Projecto Integrado - GereTPs",
      description: "<p>O que se pretende neste projeto é criar um Gestor de Trabalhos Práticos (TPs), que doravante designaremos por GereTPs. Assim o projeto consiste no desenvolvimento de um sistema de informação que permita gerir os Trabalhos Práticos que os alunos de um curso universitário têm de entregar ao longo de uma disciplina.</p><p>A ideia central é permitir receber os trabalhos (programa e relatório) entregues por cada grupo e permitir associar a cada submissão os comentários e a classificação atribuída pelo docente, permitindo gerar a pauta da turma.</p><p>Para cumprir tal tarefa é necessário que o GereTPs permita ainda:</p> <ul>  <li>Gerir a disciplina e equipa docente;</li>  <li>Gerir os turnos;</li>  <li>Gerir os grupos de cada turno e os alunos componentes;</li>  <li>Definir os trabalhos práticos (enunciado, objetivos de aprendizagem, cotação, workflow, etc.).</li></ul><p>O GereTPs deve ter as caraterísticas e oferecer as funcionalidades seguintes:</p><ul>  <li>Ser uma Aplicação acessível através de um browser clássico ou num dispositivo móvel tipo smartphone ou tablet;</li>  <li>Garantir a Persistência dos dados em BDR;</li>  <li>Fazer a gestão dos Workflows, oferecendo uma linguagem específica para sua descrição;</li>  <li>Permitir a Publicação da Pauta em diferentes formatos (pelo menos, CSV, XHTML e PDF);</li>  <li>Assegurar a Interoperabilidade com outros sistemas para importação ou exportação de dados.</li></ul>",
      begin_date: Date.new(2013,10,13),
      end_date: Date.new(2014,7,14),
      public: false,
      grades: false,
      open: true,
      max_elems: 4,
      min_elems: 2,
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
      name: "Ficha de avaliação Nº2",
      begin_date: Date.today + 15.days,
      public: false,
      open: true,
      grades: false,
      min_elems: 1,
      max_elems: 3,
      subject_id: 2,
      statement_id: 3
    },
    {
      name: "Projeto HASKELL - Parser JOIN",
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
      name: "Projecto C - Arranjo peças retangulares",
      description: "O objectivo do projecto é criar uma ferramenta de disposição de peças rectangulares sujeitas a várias restrições que permita ao utilizador colocar as peças na área de trabalho e verificar se todas as restrições são cumpridas. Adicionalmente, deveria ser possível pedir ao sistema para gerar soluções válidas ou mesmo encontrar a melhor solução possível.",
      begin_date: Date.new(2011,3,6),
      end_date: Date.new(2011,6,1),
      public: true,
      open: true,
      grades: false,
      min_elems: 1,
      max_elems: 3,
      subject_id: 8,
      statement_id: 8,
      shift_group: true
    },
    {
      name: "Projecto C + JAVA - Transitários LEI",
      description: "Pretende-se criar uma aplicação informática para a empresa Transitários LEI, que faça a gestão de camiões, localidades e clientes.",
      begin_date: Date.new(2012,3,5),
      end_date: Date.new(2012,4,15),
      public: true,
      open: true,
      grades: false,
      min_elems: 1,
      max_elems: 3,
      subject_id: 7,
      statement_id: 7
    },
    {
      name: "Projecto ASP.NET",
      description: "Pretende-se criar uma aplicação web, com recurso a ferramentas Microsoft",
      begin_date: Date.new(2013,2,25),
      end_date: Date.new(2013,6,5),
      public: true,
      open: true,
      grades: false,
      min_elems: 3,
      max_elems: 5,
      subject_id: 6,
      statement_id: 6,
      shift_group: true
    },
    {
      name: "Ficha de avaliação Nº1",
      begin_date: Date.new(2013,12,17),
      end_date: Date.new(2014,1,12),
      public: false,
      open: true,
      grades: false,
      min_elems: 1,
      max_elems: 3,
      subject_id: 2,
      statement_id: 2
    },
    {
      name: "Ficha de avaliação Nº3",
      begin_date: Date.today + 15.days,
      public: false,
      open: false,
      grades: false,
      min_elems: 1,
      max_elems: 3,
      subject_id: 2,
      statement_id: 3
    }
]

projects.each do |project|
  Project.where(project).first_or_create!
end

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
      subject_id: 1,
      statement_id: 1
    },
]

projects.each do |project|
  Project.where(project).first_or_create!
end

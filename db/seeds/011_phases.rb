puts 'seeding phases...'

phases = [
	{
		name: "Fase 1",
		description: "<p>O que se pretende neste projeto é criar um Gestor de Trabalhos Práticos (TPs), que doravante designaremos por GereTPs. Assim o projeto consiste no desenvolvimento de um sistema de informação que permita gerir os Trabalhos Práticos que os alunos de um curso universitário têm de entregar ao longo de uma disciplina.</p><p>A ideia central é permitir receber os trabalhos (programa e relatório) entregues por cada grupo e permitir associar a cada submissão os comentários e a classificação atribuída pelo docente, permitindo gerar a pauta da turma.</p>",
		begin_date: Date.new(2013,10,13),
		end_date: Date.new(2013,12,9),
		grades: true,
		open: true,
		value: 10,
		project_id: 1
	},
	{
		name: "Fase 2",
		description: "<p>O que se pretende neste projeto é criar um Gestor de Trabalhos Práticos (TPs), que doravante designaremos por GereTPs. Assim o projeto consiste no desenvolvimento de um sistema de informação que permita gerir os Trabalhos Práticos que os alunos de um curso universitário têm de entregar ao longo de uma disciplina.</p><p>A ideia central é permitir receber os trabalhos (programa e relatório) entregues por cada grupo e permitir associar a cada submissão os comentários e a classificação atribuída pelo docente, permitindo gerar a pauta da turma.</p>",
		begin_date: Date.new(2013,12,10),
		end_date: Date.new(2014,3,11),
		grades: false,
		open: true,
		value: 10,
		project_id: 1
	},
	{
		name: "Fase 3",
		description: "<p>O que se pretende neste projeto é criar um Gestor de Trabalhos Práticos (TPs), que doravante designaremos por GereTPs. Assim o projeto consiste no desenvolvimento de um sistema de informação que permita gerir os Trabalhos Práticos que os alunos de um curso universitário têm de entregar ao longo de uma disciplina.</p><p>A ideia central é permitir receber os trabalhos (programa e relatório) entregues por cada grupo e permitir associar a cada submissão os comentários e a classificação atribuída pelo docente, permitindo gerar a pauta da turma.</p>",
		begin_date: Date.new(2014,3,11),
		end_date: Date.new(2014,5,4),
		grades: false,
		open: true,
		value: 10,
		project_id: 1
	},
	{
		name: "Fase 4",
		description: "<p>O que se pretende neste projeto é criar um Gestor de Trabalhos Práticos (TPs), que doravante designaremos por GereTPs. Assim o projeto consiste no desenvolvimento de um sistema de informação que permita gerir os Trabalhos Práticos que os alunos de um curso universitário têm de entregar ao longo de uma disciplina.</p><p>A ideia central é permitir receber os trabalhos (programa e relatório) entregues por cada grupo e permitir associar a cada submissão os comentários e a classificação atribuída pelo docente, permitindo gerar a pauta da turma.</p>",
		begin_date: Date.new(2014,5,6),
		end_date: Date.new(2014,7,14),
		grades: false,
		open: false,
		value: 70,
		project_id: 1
	},
]

phases.each do |phase|
	Phase.where(phase).first_or_create!
end

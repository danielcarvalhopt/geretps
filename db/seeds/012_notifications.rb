puts 'seeding notifications...'

notifications = [
	{
		title: "Relatório da primeira fase",
		body: "O relatório da primeira fase deverá ser feito em LaTeX",
		date: Date.new(2013,11,1),
		project_id: 1
	},
	{
		title: "Submissão do relatório da primeira fase",
		body: "A submissão do relatório da primeira fase deverá ser feita no gereTPs",
		date: Date.new(2013,12,1),
		project_id: 1
	},
	{
		title: "Mais um enunciado alternativo para o PI",
		body: "Consultem o novo enunciado do PI para verem o enunciado da 3ªalternativa.",
		date: Date.new(2013,11,15),
		project_id: 1
	},
	{
		title: "Notas da avaliação do PI",
		body: "Já se encontram disponiveis as avaliações da primeira fase do PI",
		date: Date.new(2013,12,16),
		project_id: 1
	},
	{
		title: "Segunda Fase",
		body: "Já é possivel fazer submissões da segunda fase",
		date: Date.new(2014,2,23),
		project_id: 1
	},
	{
		title: "Enunciado",
		body: "Já se encontra disponivel o enunciado do projecto prático de PED - myAcademia",
		date: Date.new(2013,11,29),
		project_id: 2
	}
]

notifications.each do |notification|
  Notification.where(notification).first_or_create!
end


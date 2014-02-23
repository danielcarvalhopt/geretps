puts 'seeding deliveries...'

deliveries = [
	{
		description: "Relatório da Primeira Fase do Projecto Integrado (GereTPs). Neste relatório é explicado todas as decisões tomadas sobre a o trabalho a faser ao longo do ano.",
		public: true,
		phase_id: 1,
		group_id: 1
	},
	{
		description: "Código e Relatório final do Projeto HASKELL - Parser JOIN, desenvolvido em Laboratórios de Informática I",
		public: true,
		phase_id: 7,
		group_id: 4
	},
	{
		description: "Código e Relatório final do Projeto HASKELL - Parser JOIN, desenvolvido em Laboratórios de Informática I",
		public: true,
		phase_id: 7,
		group_id: 5
	},
	{
		description: "Código e Relatório final do Projeto HASKELL - Parser JOIN, desenvolvido em Laboratórios de Informática I",
		public: true,
		phase_id: 7,
		group_id: 6
	}
]


deliveries.each do |delivery|
	Delivery.where(delivery).first_or_create!
end

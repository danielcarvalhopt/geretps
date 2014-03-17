puts 'seeding deliveries...'

deliveries = [
	{
		description: "Relatório da Primeira Fase do Projecto Integrado (GereTPs). Neste relatório é explicado todas as decisões tomadas sobre a o trabalho a faser ao longo do ano.",
		public: true,
		evaluated: true,
		phase_id: 1,
		group_id: 1
	},
	{
		description: "Relatório da Primeira Fase do Projecto Integrado (GereTPs). Neste relatório é explicado todas as decisões tomadas sobre a o trabalho a faser ao longo do ano.",
		public: true,
		evaluated: true,
		phase_id: 1,
		group_id: 2
	}
]

deliveries.each do |delivery|
	Delivery.where(delivery).first_or_create!
end

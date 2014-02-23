puts 'seeding phases...'

phases = [
	{
		name: "Fase 1",
		begin_date: Date.new(2013,10,13),
		end_date: Date.new(2013,12,9),
		grades: false,
		open: true,
		project_id: 1
	},
	{
		name: "Fase 2",
		begin_date: Date.new(2013,12,10),
		end_date: Date.new(2014,3,10),
		grades: false,
		open: true,
		project_id: 1
	},
	{
		name: "Fase 3",
		begin_date: Date.new(2014,3,11),
		end_date: Date.new(2014,5,4),
		grades: false,
		open: true,
		project_id: 1
	},
	{
		name: "Fase 4",
		begin_date: Date.new(2014,5,6),
		end_date: Date.new(2014,7,14),
		grades: false,
		open: false,
		project_id: 1
	},
	{
		name: "Fase 1",
		begin_date: Date.new(2013,11,29),
		end_date: Date.new(2014,2,3),
		grades: false,
		open: true,
		project_id: 2
	},
	{
		name: "Fase 2",
		begin_date: Date.new(2014,2,3),
		end_date: Date.new(2014,7,14),
		grades: false,
		open: true,
		project_id: 2
	}
]


phases.each do |phase|
	Phase.where(phase).first_or_create!
end

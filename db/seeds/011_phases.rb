puts 'seeding phases...'

phases = [
	{
		name: "Fase 1",
		begin_date: Date.new(2013,10,13),
      	end_date: Date.new(2013,12,9),
      	grades: true,
      	open: true,
      	project_id: 1
	},
	{
		name: "Fase 2",
		begin_date: Date.new(2013,12,10),
      	end_date: Date.new(2014,3,10),
      	open: true,
      	project_id: 1
	},
	{
		name: "Fase 3",
		begin_date: Date.new(2014,3,11),
      	end_date: Date.new(2014,5,4),
      	project_id: 1
	},
	{
		name: "Fase 4",
		begin_date: Date.new(2014,5,6),
      	end_date: Date.new(2014,7,14),
      	project_id: 1
	},
	{
		name: "Fase 1",
		begin_date: Date.new(2013,11,29),
		end_date: Date.new(2014,2,3),
		project_id: 2,
		open: true
	},
	{
		name: "Fase 2",
		begin_date: Date.new(2014,2,3),
		end_date: Date.new(2014,7,14),
		project_id: 2,
		open: true
	}
]


phases.each do |phase|
	Phase.where("name = ? AND project_id = ?",phase[:name],phase[:project_id]).first_or_initialize.tap do |p|
		p.name = phase[:name]
		p.project = Project.find(phase[:project_id])
		p.begin_date = phase[:begin_date]
		p.end_date = phase[:end_date]
		p.grades = p[:grades] if p[:grades]
		p.open = p[:open] if p[:open]
		p.save!
	end
end

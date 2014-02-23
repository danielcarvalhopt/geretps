puts 'seeding groups...'

groups=[
	{
		identifier: "Grupo 1",
		project_id: 1
	},
	{
		identifier: "Grupo 1",
		project_id: 2
	},
	{
		identifier: "Grupo 1",
		project_id: 3
	},
	{
		identifier: "Grupo 1",
		project_id: 4
	},
	{
		identifier: "Grupo 2",
		project_id: 4
	},
	{
		identifier: "Grupo 3",
		project_id: 4
	},
	{
		identifier: "Grupo 1",
		project_id: 5
	},
	{
		identifier: "Grupo 2",
		project_id: 5
	}
]

groups.each do |group|
	Group.where(group).first_or_create!
end

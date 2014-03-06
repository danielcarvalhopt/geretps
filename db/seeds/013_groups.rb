puts 'seeding groups...'

groups=[
	{
		identifier: "Grupo 1",
		project_id: 1
	},
	{
		identifier: "Grupo 2",
		project_id: 1
	},
	{
		identifier: "Grupo 3",
		project_id: 1
	},
	{
		identifier: "Grupo 4",
		project_id: 1
	},
	{
		identifier: "Grupo 5",
		project_id: 1
	},
	{
		identifier: "Grupo 6",
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
		identifier: "Grupo 1",
		project_id: 5
	},
	{
		identifier: "Grupo 1",
		project_id: 6
	},
	{
		identifier: "Grupo 1",
		project_id: 7
	},
	{
		identifier: "Grupo 1",
		project_id: 8
	}
]

groups.each do |group|
	Group.where(group).first_or_create!
end

puts 'seeding groups...'

groups=[
	{
		identifier: "Grupo 1",
		project_id: 1
	},
	{
		identifier: "Grupo 2",
		project_id: 1
	}
]

groups.each do |group|
	Group.where(group).first_or_create!
end

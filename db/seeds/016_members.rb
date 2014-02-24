puts 'seeding members...'

members = [
	{
		student_id: 1,
		group_id: 1
	},
	{
		student_id: 2,
		group_id: 1
	},
	{
		student_id: 3,
		group_id: 1
	},
	{
		student_id: 1,
		group_id: 2
	},
	{
		student_id: 2,
		group_id: 2
	},
	{
		student_id: 3,
		group_id: 2
	},
	{
		student_id: 1,
		group_id: 3
	},
	{
		student_id: 2,
		group_id: 3
	},
	{
		student_id: 3,
		group_id: 3
	},
	{
		student_id: 1,
		group_id: 4
	},
	{
		student_id: 2,
		group_id: 5
	},
	{
		student_id: 3,
		group_id: 6
	},
	{
		student_id: 1,
		group_id: 7
	},
	{
		student_id: 2,
		group_id: 8
	},
	{
		student_id: 3,
		group_id: 7
	}
]

members.each do |member|
	Member.where(member).first_or_create!
end

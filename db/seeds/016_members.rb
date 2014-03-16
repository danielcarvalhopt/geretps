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
		student_id: 4,
		group_id: 2
	},
	{
		student_id: 5,
		group_id: 2
	},
	{
		student_id: 6,
		group_id: 2
	},
	{
		student_id: 7,
		group_id: 3
	},
	{
		student_id: 8,
		group_id: 3
	},
	{
		student_id: 9,
		group_id: 4
	},
	{
		student_id: 10,
		group_id: 4
	},
	{
		student_id: 11,
		group_id: 5
	},
	{
		student_id: 12,
		group_id: 5
	},
	{
		student_id: 13,
		group_id: 6
	},
	{
		student_id: 14,
		group_id: 6
	}
]

members.each do |member|
	Member.where(member).first_or_create!
end

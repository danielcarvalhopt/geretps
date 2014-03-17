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
]

members.each do |member|
	Member.where(member).first_or_create!
end

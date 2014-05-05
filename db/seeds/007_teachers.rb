require "open-uri"
puts "seeding teachers..."

teachers = [
  { user_id: 1 },
  { user_id: 19}
]

teachers.each do |teacher|
  Teacher.where(user_id: teacher[:user_id]).first_or_create!
end

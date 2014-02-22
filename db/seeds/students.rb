require "open-uri"
puts "seeding students..."

students = [
  { identifier: "61008",
    user_id: 2
  },
  { identifier: "25329",
    user_id: 3
  },
  { identifier: "25339",
    user_id: 4
  }
]

students.each do |student|
  Student.where(user_id: student[:user_id].first_or_initialize.tap do |s|
    s.identifier = student[:identifier]
    s.save
  end
end

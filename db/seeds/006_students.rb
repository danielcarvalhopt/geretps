require "open-uri"
puts "seeding students..."

students = [
  { identifier: "00001",
    user_id: 2
  },
  { identifier: "00002",
    user_id: 3
  },
  { identifier: "00003",
    user_id: 4
  },
  { identifier: "00004",
    user_id: 5
  },
  { identifier: "00005",
    user_id: 6
  }
]

students.each do |student|
  Student.where(user_id: student[:user_id]).first_or_initialize.tap do |s|
    s.identifier = student[:identifier]
    s.save
  end
end

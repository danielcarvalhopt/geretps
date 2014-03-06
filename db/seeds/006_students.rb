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
  },
  { identifier: "00001",
    user_id: 5
  },
  { identifier: "00002",
    user_id: 6
  },
  { identifier: "00003",
    user_id: 7
  },
  { identifier: "00004",
    user_id: 8
  },
  { identifier: "00005",
    user_id: 9
  },
  { identifier: "00006",
    user_id: 10
  },
  { identifier: "00007",
    user_id: 11
  },
  { identifier: "00008",
    user_id: 12
  },
  { identifier: "00009",
    user_id: 13
  },
  { identifier: "00010",
    user_id: 14
  },
  { identifier: "00011",
    user_id: 15
  },
  { identifier: "00012",
    user_id: 16
  },
  { identifier: "00013",
    user_id: 17
  },
  { identifier: "00014",
    user_id: 18
  }
]

students.each do |student|
  Student.where(user_id: student[:user_id]).first_or_initialize.tap do |s|
    s.identifier = student[:identifier]
    s.save
  end
end

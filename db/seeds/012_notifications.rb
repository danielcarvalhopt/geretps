puts 'seeding notifications...'

notifications = [
]

notifications.each do |notification|
  Notification.where(notification).first_or_create!
end


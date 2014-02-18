require "open-uri"
puts "seeding users..."

users = [
  {
    name: "José Carlos Ramalho",
    about: "José Carlos Ramalho graduated in 1991 as a Systems and Informatics Engineer. During his graduation he has worked as a freelancer software developer and as a network technician for Apple. During this time he also taught several courses about computer programming for several public institutions.In 1991 he joined the Department of Informatics as an Assistent and started his MSc work. He has worked as a teacher since 1991 until the present. He also has been a researcher of Algoritmi's Research Center until 2004. In 2004 he moved from Algoritmi to the newly created CCTC Research Center.",
    phone: "253604479", 
    email: "jcr@di.uminho.pt",
    password: "jcrjcrjcr",
    avatar: "http://www3.di.uminho.pt/~jcr/jcr@keep.jpg",
    type: 0,
    identifier: nil
  },
  {
    name: "Daniel Carvalho",
    about: "Sou o Daniel" ,
    phone: "919985936", 
    email: "mail@danielcarvalho.pt",
    password: "qweqweqwe",
    avatar: "https://iflychat.com/sites/default/files/images/default-avatar%20(1).png",
    type: 1,
    identifier: "61008"
  },
  {
    name: "André Santos",
    about: "Sou o André",
    phone: "919985938", 
    email: "mail@andre-santos.pt",
    password: "qweqweqwe",
    avatar: "https://iflychat.com/sites/default/files/images/default-avatar%20(1).png",
    type: 1,
    identifier: "61009"
  },
  {
    name: "Ricardo Branco",
    about: "Sou o Ricardo",
    phone: "919985937", 
    email: "mail@ricardo.pt",
    password: "qweqweqwe",
    avatar: "https://iflychat.com/sites/default/files/images/default-avatar%20(1).png",
    type: 1,
    identifier: "61010"
  }
]

users.each do |user|
  @user = User.where(email: user[:email]).first_or_initialize.tap do |u|
    u.name = user[:name]
    u.about = user[:about]
    u.phone = user[:phone]
    u.email = user[:email]
    u.password = user[:password]
    u.avatar = open(user[:avatar])
    u.save!
  end

  if user[:type] == 0
    Teacher.where(user_id: @user.id).first_or_initialize.tap do |t|
      t.user_id = @user.id
      t.save
    end
  else 
    Student.where(user_id: @user.id).first_or_initialize.tap do |s|
      s.user_id = @user.id
      s.identifier = user[:identifier]
      s.save
    end
  end   
end

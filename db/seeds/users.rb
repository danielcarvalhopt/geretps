require "open-uri"
puts "seeding users..."

users = [
  {
    name: "José Carlos Ramalho",
    about: "José Carlos Ramalho graduated in 1991 as a Systems and Informatics Engineer. During his graduation he has worked as a freelancer software developer and as a network technician for Apple. During this time he also taught several courses about computer programming for several public institutions.In 1991 he joined the Department of Informatics as an Assistent and started his MSc work. He has worked as a teacher since 1991 until the present. He also has been a researcher of Algoritmi's Research Center until 2004. In 2004 he moved from Algoritmi to the newly created CCTC Research Center.",
    phone: "253604479", 
    email: "jcr@di.uminho.pt",
    password: "jcrjcrjcr",
    avatar: "http://4vector.com/i/free-vector-male-user-icon-clip-art_125620_male-user-icon-clip-art/Male_User_Icon_clip_art_hight.png"
  },
  {
    name: "Daniel Carvalho",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails." ,
    phone: "919985936", 
    email: "mail@danielcarvalho.pt",
    password: "qweqweqwe",
    avatar: "http://4vector.com/i/free-vector-male-user-icon-clip-art_125620_male-user-icon-clip-art/Male_User_Icon_clip_art_hight.png"
  },
  {
    name: "André Santos",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails.",
    phone: "919985938", 
    email: "mail@andre-santos.pt",
    password: "qweqweqwe",
    avatar: "http://4vector.com/i/free-vector-male-user-icon-clip-art_125620_male-user-icon-clip-art/Male_User_Icon_clip_art_hight.png"
  },
  {
    name: "Ricardo Branco",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails.",
    phone: "919985937", 
    email: "mail@ricardo.pt",
    password: "qweqweqwe",
    avatar: "http://4vector.com/i/free-vector-male-user-icon-clip-art_125620_male-user-icon-clip-art/Male_User_Icon_clip_art_hight.png"
  }
]

users.each do |user|
  User.where(email: user[:email]).first_or_initialize.tap do |u|
    u.name = user[:name]
    u.about = user[:about]
    u.phone = user[:phone]
    u.password = user[:password]
    u.avatar = open(user[:avatar])
    u.save!
  end
end

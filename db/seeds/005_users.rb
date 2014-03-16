require "open-uri"
puts "seeding users..."

users = [
  {
    name: "Albert Einstein",
    about: 'Albert Einstein foi um físico teórico alemão, posteriormente radicado nos Estados Unidos, que desenvolveu a teoria da relatividade geral, um dos dois pilares da física moderna (ao lado da mecânica quântica). Embora mais conhecido pela sua fórmula de equivalência massa-energia, E = mc2 (que foi chamada de "a equação mais famosa do mundo"), foi laureado com o Prémio Nobel de Física de 1921 "pelos seus serviços à física teórica e, especialmente, pela sua descoberta da lei do efeito fotoelétrico".',
    phone: "900000000",
    email: "einstein@mail.com",
    password: "qweqweqwe",
    avatar: "http://media.npr.org/assets/img/2011/09/28/93434191-einstein-tongue_custom-36fb0ce35776dc2d92eda90880022bf48a67e192-s6-c30.jpg"
  },
  {
    name: "Steve Mobs",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails." ,
    phone: "900000001",
    email: "mail@danielcarvalho.pt",
    password: "qweqweqwe",
    avatar: "http://blogs.kqed.org/stateofhealth/files/2011/11/Jobs_2003_rev1.jpg"
  },
  {
    name: "Mark Zoidberg",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails.",
    phone: "900000002",
    email: "user@mail.com",
    password: "password123",
    avatar: "http://www.biography.com/imported/images/Biography/Images/Profiles/Z/Mark-Zuckerberg-507402-1-402.jpg"
  },
  {
    name: "Bill Games",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails.",
    phone: "900000003",
    email: "bill@mail.com",
    password: "qweqweqwe",
    avatar: "http://images.cdn.impresa.pt/exameinformatica/2013-10-02-bill-gates.jpg"
  },
  {
    name: "Tim Berners Lee",
    about: "Fundador do World Wide Web um dos primeiros navegadores a surfar pela recém inventada internet.",
    phone: "900000004",
    email: "berners-lee@www.com",
    password: "qweqweqwe",
    avatar: "http://yourlifesolution.com/7/wp-content/uploads/2012/07/tim-berners-lee.jpg"
  },
  {
    name: "Richard Matthew Stallman",
    about: "O principal responsável pelo movimento Software Livre é reconhecido mundialmente por sua luta contra o copyright. Desde 1990 dedica seu tempo em prol do software livre e contra a patente de softwares.",
    phone: "900000005",
    email: "stallman@gnu.com",
    password: "qweqweqwe",
    avatar: "http://upload.wikimedia.org/wikipedia/commons/f/f7/Richard_Matthew_Stallman.jpeg"
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

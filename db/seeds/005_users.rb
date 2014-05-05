require "open-uri"
puts "seeding users..."

users = [
  {
    name: "José Carlos Ramalho",
    about: "José Carlos Ramalho graduated in 1991 as a Systems and Informatics Engineer. During his graduation he has worked as a freelancer software developer and as a network technician for Apple. During this time he also taught several courses about computer programming for several public institutions.In 1991 he joined the Department of Informatics as an Assistent and started his MSc work. He has worked as a teacher since 1991 until the present. He also has been a researcher of Algoritmi's Research Center until 2004. In 2004 he moved from Algoritmi to the newly created CCTC Research Center.",
    phone: "253604479",
    email: "jcr@di.uminho.pt",
    password: "jcrjcrjcr",
    avatar: "public/seeds/user_avatars/ramalho.jpg"
  },
  {
    name: "Daniel Carvalho",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails." ,
    phone: "919985936",
    email: "mail@danielcarvalho.pt",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/danielcarvalho.jpg"
  },
  {
    name: "André Santos",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails.",
    phone: "919985938",
    email: "mail@andre-santos.pt",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/andresantos.jpg"
  },
  {
    name: "Ricardo Branco",
    about: "Estudante do Mestrado em Engenharia Informática e developer em Ruby on Rails.",
    phone: "919985937",
    email: "28.ricardobranco@gmail.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/ricardobranco.jpg"
  },
  {
    name: "Tim Berners-Lee",
    about: "Fundador do World Wide Wibe um dos primeiros navegadores a surfar pela recém inventada internet.",
    phone: "900000001",
    email: "berners-lee@www.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/timbernerslee.jpg"
  },
  {
    name: "Richard Matthew Stallman",
    about: "O principal responsável pelo movimento Software Livre é reconhecido mundialmente por sua luta contra o copyright. Desde 1990 dedica seu tempo em prol do software livre e contra a patente de softwares.",
    phone: "900000002",
    email: "stallman@gnu.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/richardstallman.jpg"
  },
  {
    name: "Ray Tomlinson",
    about: "O programador é o responsável pela criação do email em 1971. Naquela época, Ray implementou um sistema de correio eletrônico na ARPANET e a famosa @ conquistou o mundo. O primeiro email do mundo foi, obviamente, o de seu criador: tomlinson@bbn-tenexa.",
    phone: "900000003",
    email: "tomlinson@bbn-tenexa.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/tomlinson.jpg"
  },
  {
    name: "Bill Gates",
    about: "Um dos principais responsáveis pelo boom da computação pessoal, Bill Gates é reconhecido mundialmente por sua fortuna e por ser o fundador da Microsoft. Hoje o magnata dedica seu tempo à filantropia e a doações generosas.",
    phone: "900000004",
    email: "bill-gates@microsoft.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/billgates.jpg"
  },
  {
    name: "Steve Jobs",
    about: "Co-fundador da Apple, uma das marcas mais desejadas e valorizadas do mundo. Mesmo sem investir pesado em propaganda, Steve é sinônimo de novidades e é capaz de derrubar o Twitter apenas lançando um novo produto, como no caso do iPad.",
    phone: "900000005",
    email: "steve-jobs@apple.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/stevejobs.jpg"
  },
  {
    name: "Linus Torvalds",
    about: "Criador do núcleo do Linux, sistema operacional de código livre. O finlandês é envolvido com programação desde os 11 anos, depois que seu avô comprou um dos primeiros computadores dos anos 80.",
    phone: "900000006",
    email: "linus@linux.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/linustorvalds.jpg"
  },
  {
    name: "Vint Cerf",
    about: "Considerado como um dos pais da internet, junto a Robert Kahn desenvolveu o protocolo TCP/IP, até hoje o principal protocolo de transmissão de informações pela internet. Desde 2005 é vice-presidente da Google.",
    phone: "900000007",
    email: "cerf@google.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/vintcerf.jpg"
  },
  {
    name: "Steve Ballmer",
    about: "Um dos grandes nomes da Microsoft ao lado de Bill Gates. Hoje é o presidente da companhia depois que seu colega se aposentou.",
    phone: "900000008",
    email: "ballmer@microsoft.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/steveballmer.jpg"
  },
  {
    name: "Steve Wozniak",
    about: "Co-fundador da Apple, ao lado de Steve Jobs. Depois de várias brigas, deixou a empresa e fundou uma companhia de soluções para comunicação sem fio.",
    phone: "900000009",
    email: "wozniak@apple.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/stevewozniak.jpg"
  },
  {
    name: "Sergey Brin",
    about: "A partir de um projeto de doutorado, um dos maiores fenômenos da internet surgiu: o Google. O buscador é o fio condutor da empresa que hoje conta com vários serviços online, aplicativos e até um celular.",
    phone: "900000010",
    email: "brinn@google.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/sergeybrin.jpg"
  },
  {
    name: "Larry Page",
    about: "A partir de um projeto de doutorado, um dos maiores fenômenos da internet surgiu: o Google. O buscador é o fio condutor da empresa que hoje conta com vários serviços online, aplicativos e até um celular.",
    phone: "900000011",
    email: "larry@google.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/larrypage.jpg"
  },
  {
    name: "Michael Dell",
    about: "Só pelo sobrenome dá para saber quem é esse homem. Fundador da marca Dell, uma das maiores fabricantes de harware do mundo.",
    phone: "900000012",
    email: "dell@dell.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/michaeldell.jpg"
  },
  {
    name: "Kazuo Hirai",
    about: "Diretor executivo da Sony Group e vice-presidente executivo da Sony Corporation. Elevou o PlayStation ao topo dos consoles mais desejados e comanda a jornada da marca desde o PS1 passando pelo PSP.",
    phone: "900000013",
    email: "hirai@sony.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/kazuohirai.jpg"
  },
  {
    name: "Mark Zuckerberg",
    about: "Fundador do Facebook, a rede social mais usada no mundo. O jovem estudou em Harvard e foi lá que fundou o site de relacionamentos. Foi eleito pela Forbes como o bilionário mais jovem do mundo, com 1,5 bilhão de dólares na conta bancária.",
    phone: "900000014",
    email: "zuckerberg@facebook.com",
    password: "qweqweqwe",
    avatar: "public/seeds/user_avatars/markzuckerberg.jpg"
  },
  {
    name: "Rui Mendes",
    about: "Professor Auxiliar, Departamento de Informática, Universidade do Minho",
    phone: "900000015",
    email: "azuki@di.uminho.pt",
    password: "rcmrcmrcm"
  }
]

users.each do |user|
  User.where(email: user[:email]).first_or_initialize.tap do |u|
    u.name = user[:name]
    u.about = user[:about]
    u.phone = user[:phone]
    u.password = user[:password]
    u.avatar = open(user[:avatar]) if user[:avatar]
    u.save!
  end
end

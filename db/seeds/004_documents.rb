puts 'seeding documents...'

documents = [
    {
      name: "Enunciado PI 13/14",
      description: "Enunciado Projeto Integrado de Engenharia de Linguagens 2013/2014",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Ficha de Avaliação 1",
      description: "Enunciado da Ficha de Avaliação 1 de Engenharia de Gramatical 2013/2014",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Ficha de Avaliação 2",
      description: "Enunciado da Ficha de Avaliação 2 de Engenharia de Gramatical 2013/2014",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Ficha de Avaliação 3",
      description: "Enunciado da Ficha de Avaliação 3 de Engenharia de Gramatical 2013/2014",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Enunciado PED 13/14",
      description: "Enunciado Processamento Estruturado de Documentos 2013/2014",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Enunciado LI IV 12/13",
      description: "Enunciado de Laboratórios de Informática IV 2012/2013",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Enunciado LI III 11/12",
      description: "Enunciado de Laboratórios de Informática III 2011/2012",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Enunciado LI II 10/11",
      description: "Enunciado de Laboratórios de Informática II 2010/2011",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Enunciado LI I 10/11",
      description: "Enunciado de Laboratórios de Informática I 2009/2010",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
    {
      name: "Modelo OAIS",
      description: "An Open Archival Information System (or OAIS) is an archive, consisting of an organization of people and systems, that has accepted the responsibility to preserve information and make it available for a Designated Community.",
      file: "public/seeds/documents/e_pi.pdf",
      active: true
    },
]

documents.each do |document|
  Document.where(name: document[:name]).first_or_initialize.tap do |d|
    d.description = document[:description]
    d.file = open(document[:file])
    d.save!
  end
end

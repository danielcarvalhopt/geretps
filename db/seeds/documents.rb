puts 'seeding documents...'

documents = [
    {
      name: "Enunciado GereTPs",
      description: "Define o que é para fazer para o projecto GereTPs",
      file: "http://www3.di.uminho.pt/~jcr/XML/publicacoes/artigos/2002/JLRH02-CLEI.pdf"
    }
]

documents.each do |document|
  Document.where(document).first_or_initialize.tap do |s|
    s.name = document[:name]
    s.description = document[:description]
    s.file = open(document[:file])
  end
end

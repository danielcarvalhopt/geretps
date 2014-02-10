puts 'seeding statements...'

statements = [
    {
      name: "Enunciado GereTPs",
      description: "Define o que é para fazer para o projecto GereTPs",
      file: "http://www3.di.uminho.pt/~jcr/XML/publicacoes/artigos/2002/JLRH02-CLEI.pdf"
    }
]

statements.each do |statement|
  File.where(statement).first_or_initialize.tap do |s|
    s.name = statement[:name]
    s.description = statement[:description]
    s.file = open(statement[:file])
  end
end

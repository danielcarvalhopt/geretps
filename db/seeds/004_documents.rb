puts 'seeding documents...'

documents = [
    {
      name: "Modelo OAIS",
      description: "An Open Archival Information System (or OAIS) is an archive, consisting of an organization of people and systems, that has accepted the responsibility to preserve information and make it available for a Designated Community.",
      file: "https://dl.dropboxusercontent.com/u/13351850/e_pi.pdf",
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

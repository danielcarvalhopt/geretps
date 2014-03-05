puts 'seeding required files...'

required_files = [
  {
    name: "relatorio_F01.pdf",
    phase_id: 1,
  },
  {
    name: "apresentacao_F01.pdf",
    phase_id: 1,
  },
  {
    name: "diagramas_F01.zip",
    phase_id: 1,
  }
]

required_files.each do |required_file|
  RequiredFile.where(required_file).first_or_create!
end

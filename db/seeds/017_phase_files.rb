puts 'seeding phase files...'

phase_files = [
  {
    phase_id: 1,
    document_id: 10
  }
]

phase_files.each do |phase_file|
  PhaseFile.where(phase_file).first_or_create!
end

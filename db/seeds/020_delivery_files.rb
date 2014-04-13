puts 'seeding delivery files...'

delivery_files = [
  {
    delivery_id: 1,
    document_id: 11
  },
  {
    delivery_id: 1,
    document_id: 12
  },
  {
    delivery_id: 1,
    document_id: 13
  },
  {
    delivery_id: 1,
    document_id: 14
  }
]

delivery_files.each do |delivery_file|
  DeliveryFile.where(delivery_file).first_or_create!
end

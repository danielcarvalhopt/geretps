json.array!(@delivery_files) do |delivery_file|
  json.extract! delivery_file, :id, :delivery_id, :document_id
  json.url delivery_file_url(delivery_file, format: :json)
end

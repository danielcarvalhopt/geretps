json.array!(@required_files) do |required_file|
  json.extract! required_file, :id, :name, :description, :phase_id
  json.url required_file_url(required_file, format: :json)
end

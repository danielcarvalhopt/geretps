json.array!(@documents) do |document|
  json.extract! document, :id, :name, :description, :notes
  json.url document_url(document, format: :json)
end

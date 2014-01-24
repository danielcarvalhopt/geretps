json.array!(@instituitions) do |instituition|
  json.extract! instituition, :id, :name
  json.url instituition_url(instituition, format: :json)
end

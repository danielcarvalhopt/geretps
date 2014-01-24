json.array!(@shifts) do |shift|
  json.extract! shift, :id, :name, :subject_id
  json.url shift_url(shift, format: :json)
end

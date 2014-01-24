json.array!(@phases) do |phase|
  json.extract! phase, :id, :name, :description, :begin_date, :end_date, :open, :grades, :grades, :value, :statement_id, :project_id
  json.url phase_url(phase, format: :json)
end

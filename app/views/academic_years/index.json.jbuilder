json.array!(@academic_years) do |academic_year|
  json.extract! academic_year, :id, :academic_year
  json.url academic_year_url(academic_year, format: :json)
end

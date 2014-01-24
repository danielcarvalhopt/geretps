json.array!(@projetcts) do |projetct|
  json.extract! projetct, :id, :name, :description, :begin_date, :end_date, :public, :grades, :open, :max_elems, :min_elems, :subject_id, :projects
  json.url projetct_url(projetct, format: :json)
end

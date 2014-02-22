json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :begin_date, :end_date, :public, :grades, :open, :max_elems, :min_elems, :subject_id, :projects
  json.url project_url(project, format: :json)
end

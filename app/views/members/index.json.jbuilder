json.array!(@members) do |member|
  json.extract! member, :id, :student_id, :group_id
  json.url member_url(member, format: :json)
end

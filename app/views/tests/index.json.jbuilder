json.array!(@tests) do |test|
  json.extract! test, :id, :phase_id, :input_id, :output_id
  json.url test_url(test, format: :json)
end

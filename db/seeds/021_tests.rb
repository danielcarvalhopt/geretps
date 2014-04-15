puts 'seeding tests...'

tests = [
  {
    name: "Teste de expanção de siglas.",
    phase_id: 1,
    input_id: 14,
    output_id: 14
  },
  {
    name: "Teste de funcionamento para números positivos.",
    phase_id: 1,
    input_id: 14,
    output_id: 14
  },
  {
    name: "Teste de funcionamento para números negativos.",
    phase_id: 1,
    input_id: 14,
    output_id: 14
  },
  {
    name: "Teste de funcionamento para números fracionários.",
    phase_id: 1,
    input_id: 14,
    output_id: 14
  }
]

if(Test.count == 0)
  tests.each do |test|
    new_test = Test.new
    new_test.name = test[:name]
    new_test.phase_id = test[:phase_id]
    new_test.input_id = test[:input_id]
    new_test.output_id = test[:output_id]
    new_test.save!
  end
end

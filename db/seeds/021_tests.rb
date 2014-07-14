puts 'seeding tests...'

tests = [
  {
    name: "Teste de expanção de siglas.",
    executable: "bin",
    phase_id: 1,
    input_id: 14,
    output_id: 14
  },
  {
    name: "Teste de funcionamento para números positivos.",
    executable: "bin",
    phase_id: 1,
    input_id: 14,
    output_id: 14
  },
  {
    name: "Teste de funcionamento para números negativos.",
    executable: "bin",
    phase_id: 1,
    input_id: 14,
    output_id: 14
  },
  {
    name: "Teste de funcionamento para números fracionários.",
    executable: "bin",
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
    new_test.executable = test[:executable]
    new_test.save!
  end
end

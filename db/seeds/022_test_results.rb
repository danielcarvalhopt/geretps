puts 'seeding test results...'

test_results = [
  {
    test_id: 1,
    delivery_id: 1,
    diff: "puts 'seeding courses...'                                          puts 'seeding courses...'\n\ncourses = [                                                        courses = [\n  {                                                                  {\n    name: 'LEI',                                                |      name: 'Licenciatura em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5 \n  },                                                                 },\n  {                                                                  {\n    name: 'MEI',                                                |      name: 'Mestrado em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5\n  }                                                                  }\n]                                                                  ]\n\ncourses.each do |course|                                           courses.each do |course|\n  Course.where(course).first_or_create!                              Course.where(course).first_or_create!\nend                                                                end\n\n" 
  },
  {
    test_id: 2,
    delivery_id: 1,
    diff: "puts 'seeding courses...'                                          puts 'seeding courses...'\n\ncourses = [                                                        courses = [\n  {                                                                  {\n    name: 'LEI',                                                |      name: 'Licenciatura em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5 \n  },                                                                 },\n  {                                                                  {\n    name: 'MEI',                                                |      name: 'Mestrado em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5\n  }                                                                  }\n]                                                                  ]\n\ncourses.each do |course|                                           courses.each do |course|\n  Course.where(course).first_or_create!                              Course.where(course).first_or_create!\nend                                                                end\n\n" 
  },
  {
    test_id: 3,
    delivery_id: 1,
    diff: "puts 'seeding courses...'                                          puts 'seeding courses...'\n\ncourses = [                                                        courses = [\n  {                                                                  {\n    name: 'LEI',                                                |      name: 'Licenciatura em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5 \n  },                                                                 },\n  {                                                                  {\n    name: 'MEI',                                                |      name: 'Mestrado em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5\n  }                                                                  }\n]                                                                  ]\n\ncourses.each do |course|                                           courses.each do |course|\n  Course.where(course).first_or_create!                              Course.where(course).first_or_create!\nend                                                                end\n\n" 
  },
  {
    test_id: 4,
    delivery_id: 1,
    diff: "puts 'seeding courses...'                                          puts 'seeding courses...'\n\ncourses = [                                                        courses = [\n  {                                                                  {\n    name: 'LEI',                                                |      name: 'Licenciatura em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5 \n  },                                                                 },\n  {                                                                  {\n    name: 'MEI',                                                |      name: 'Mestrado em Engenharia Informática',\n    institution_id: 5                                                  institution_id: 5\n  }                                                                  }\n]                                                                  ]\n\ncourses.each do |course|                                           courses.each do |course|\n  Course.where(course).first_or_create!                              Course.where(course).first_or_create!\nend                                                                end\n\n" 
  }
]

test_results.each do |test_result|
  TestResult.where(test_result).first_or_create!
end

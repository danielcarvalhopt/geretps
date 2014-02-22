puts 'seeding academic years...'

academic_years = [
    { academic_year: "2008/2009" },
    { academic_year: "2009/2010" },
    { academic_year: "2010/2011" },
    { academic_year: "2011/2012" },
    { academic_year: "2013/2014" },
]

academic_years.each do |academic_year|
  AcademicYear.where(academic_year).first_or_create!
end

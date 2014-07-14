require 'nokogiri'

module Export
  class XSL

    def initialize(project)
      @project = project
    end

    def xml
      @students = @project.subject.students
      build = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.grades{
          xml.project @project.name
          @project.subject.students.sort!{|a,b| a.name.downcase <=> b.name.downcase}.each do |s|
            xml.student{
              xml.identifier s.identifier
              xml.name s.name
              @project.phases.each do |ph|
                xml.phase ph.grade(s.id)
              end
              xml.project_grade @project.grade(s.id)
            }
          end
        }
      end
      File.open(Rails.root.join('public/export',"final_grades_#{@project.id}"+'.xml'), 'wb') { |file| file.write(build.to_xml) }
      system("fop -xml public/export/final_grades_#{@project.id}.xml -xsl public/export/grades.xsl -pdf public/export/final_grades_#{@project.id}.pdf")
    end
  end
end
